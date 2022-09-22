//
//  ErgastAPI.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

protocol DriverApi {
    func getDrivers(year: Int) async throws -> [Models.Driver]
    func getConstructorStandings() async throws -> [Models.ConstructorStanding]
}

struct ErgastApi: DriverApi {
    let network: Network

    func getDrivers(year: Int) async throws -> [Models.Driver] {
        let url = ErgastUrls.drivers(year: year)

        let response: ErgastInterface.DriverYear.DriverYear = try await network
            .requestAsync(for: url)

        return response.mrData.driverTable.drivers.map { driver in
            Models.Driver(
                driverId: driver.driverID,
                permanentNumber: driver.permanentNumber,
                code: driver.code,
                url: driver.url,
                givenName: driver.givenName,
                familyName: driver.familyName,
                dateOfBirth: driver.dateOfBirth,
                nationality: driver.nationality
            )
        }
    }

    func getConstructorStandings() async throws -> [Models.ConstructorStanding] {
        let url = ErgastUrls.constructorStandings()

        let response: ErgastInterface.ConstructorStandings.ConstructorStandings = try await network
            .requestAsync(for: url)

        return response
            .mrData
            .standingsTable
            .standingsLists
            .first!
            .constructorStandings
            .map { standings in
                Models.ConstructorStanding(
                    position: standings.position,
                    positionText: standings.positionText,
                    points: standings.points,
                    wins: standings.wins,
                    constructor: Models.Constructor(
                        constructorId: standings.constructor.constructorId,
                        url: standings.constructor.url,
                        name: standings.constructor.name,
                        nationality: standings.constructor.nationality
                    )
                )
            }
    }
}

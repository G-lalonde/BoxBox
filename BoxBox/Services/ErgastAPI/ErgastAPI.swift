//
//  ErgastAPI.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

protocol DriverApi {
    func getDriverStanding() async throws -> [Models.DriverStandings]
    func getConstructorStanding() async throws -> [Models.ConstructorStanding]
}

struct ErgastApi: DriverApi {
    let network: Network

    func getDriverStanding() async throws -> [Models.DriverStandings] {
        let url = ErgastUrls.driverStanding()

        let response: ResponseDriverStandings = try await network
            .requestAsync(for: url)

        return response
            .mrData
            .standingsTable
            .standingsLists
            .first!
            .driverStandings
            .map { standing in
                Models.DriverStandings(
                    position: standing.position,
                    points: standing.points,
                    wins: standing.wins,
                    driver: Models.Driver(
                        driverId: standing.driver.driverId,
                        permanentNumber: standing.driver.permanentNumber,
                        code: standing.driver.code,
                        url: standing.driver.url,
                        givenName: standing.driver.givenName,
                        familyName: standing.driver.familyName,
                        dateOfBirth: standing.driver.dateOfBirth,
                        nationality: standing.driver.nationality
                    ),
                    constructors: Models.Constructor(
                        constructorId: standing.constructors.first!.constructorId,
                        url: standing.constructors.first!.url,
                        name: standing.constructors.first!.name,
                        nationality: standing.constructors.first!.nationality
                    )
                )
            }
    }

    func getConstructorStanding() async throws -> [Models.ConstructorStanding] {
        let url = ErgastUrls.constructorStanding()

        let response: ResponseConstructorStandings = try await network
            .requestAsync(for: url)

        return response
            .mrData
            .standingsTable
            .standingsLists
            .first!
            .constructorStandings
            .map { standing in
                Models.ConstructorStanding(
                    position: standing.position,
                    positionText: standing.positionText,
                    points: standing.points,
                    wins: standing.wins,
                    constructor: .init(
                        constructorId: standing.constructor.constructorId,
                        url: standing.constructor.url,
                        name: standing.constructor.name,
                        nationality: standing.constructor.nationality
                    )
                )
            }
    }
}

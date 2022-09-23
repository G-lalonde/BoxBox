//
//  ErgastAPI.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

protocol DriverApi {
    func getDriverStanding() async throws -> [Models.DriverStandings]
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
}

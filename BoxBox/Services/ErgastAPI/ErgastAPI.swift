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
    func getCurrentSchedule() async throws -> [Models.Schedule]
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

    func getCurrentSchedule() async throws -> [Models.Schedule] {
        let url = ErgastUrls.currentSchedule()

        let response: ResponseCurrentSchedule = try await network
            .requestAsync(for: url)

        return response
            .mrData
            .raceTable
            .races
            .map { race in
                Models.Schedule(
                    season: race.season,
                    round: race.round,
                    url: race.url,
                    raceName: race.raceName,
                    circuit: Models.Circuit(
                        circuitId: race.circuit.circuitId,
                        url: race.circuit.url,
                        circuitName: race.circuit.circuitName,
                        location: Models.Location(
                            lat: race.circuit.location.lat,
                            long: race.circuit.location.long,
                            locality: race.circuit.location.locality,
                            country: race.circuit.location.country
                        )
                    ),
                    raceTime: Models.RaceTime(
                        date: race.date,
                        time: race.time
                    ),
                    fp1: Models.RaceTime(
                        date: race.firstPractice.date,
                        time: race.firstPractice.time
                    ),
                    fp2: Models.RaceTime(
                        date: race.secondPractice.date,
                        time: race.secondPractice.time
                    ),
                    fp3: race.thirdPractice != nil
                        ? Models.RaceTime(
                            date: race.thirdPractice!.date,
                            time: race.thirdPractice!.time
                        )
                        : nil,
                    sprint: race.sprint != nil
                        ? Models.RaceTime(
                            date: race.sprint!.date,
                            time: race.sprint!.time
                        )
                        : nil,
                    quali: Models.RaceTime(
                        date: race.qualifying.date,
                        time: race.qualifying.time
                    )
                )
            }
    }
}

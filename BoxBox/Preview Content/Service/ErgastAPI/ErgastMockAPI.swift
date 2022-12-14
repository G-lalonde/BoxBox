//
//  ErgastMockAPI.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

struct ErgastMockApi: DriverApi {
    func getDriverStanding() async throws -> [Models.DriverStandings] {
        return [.mock1, .mock2, .mock3]
    }

    func getConstructorStanding() async throws -> [Models.ConstructorStanding] {
        return [.mock1, .mock2, .mock3]
    }

    func getCurrentSchedule() async throws -> [Models.Schedule] {
        return [.mock1, .mock2, .mock3]
    }
}

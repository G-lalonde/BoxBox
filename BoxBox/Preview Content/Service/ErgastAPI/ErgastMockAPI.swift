//
//  ErgastMockAPI.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

struct ErgastMockApi: DriverApi {
    let network: Network

    func getDriverStanding() async throws -> [Models.DriverStandings] {
        return [.mock1, .mock2, .mock3]
    }
}

//
//  ErgastMockAPI.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

struct ErgastMockApi: DriverApi {
    let network: Network

    func getDrivers(year: Int) async throws -> [Driver] {
        return [.mock1, .mock2, .mock3]
    }
}

//
//  ErgastAPI.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

protocol DriverApi {
    func getDrivers(year: Int) async throws -> [Driver]
}

struct ErgastApi: DriverApi {
    let network: Network

    func getDrivers(year: Int) async throws -> [Driver] {
        let url = ErgastUrls.drivers(year: year)

        let response: ErgastInterface.DriverYear = try await network.requestAsync(for: url)

        return response.mrData.driverTable.drivers.map { driver in
            Driver(
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
}

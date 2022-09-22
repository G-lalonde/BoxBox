//
//  DriverInterface.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

// MARK: - DriverYear

extension ErgastInterface {
    enum DriverYear {
        struct DriverYear: Codable {
            let mrData: MRData

            enum CodingKeys: String, CodingKey {
                case mrData = "MRData"
            }
        }

        // MARK: - MRData

        struct MRData: Codable {
            let xmlns: String
            let series: String
            let url: String
            let limit, offset, total: String
            let driverTable: DriverTable

            enum CodingKeys: String, CodingKey {
                case xmlns, series, url, limit, offset, total
                case driverTable = "DriverTable"
            }
        }

        // MARK: - DriverTable

        struct DriverTable: Codable {
            let season: String
            let drivers: [Driver]

            enum CodingKeys: String, CodingKey {
                case season
                case drivers = "Drivers"
            }
        }

        // MARK: - Driver

        struct Driver: Codable {
            let driverID, permanentNumber, code: String
            let url: String
            let givenName, familyName, dateOfBirth, nationality: String

            enum CodingKeys: String, CodingKey {
                case driverID = "driverId"
                case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
            }
        }
    }
}

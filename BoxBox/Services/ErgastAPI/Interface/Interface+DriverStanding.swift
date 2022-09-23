// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseDriverStandings = try? newJSONDecoder().decode(ResponseDriverStandings.self, from: jsonData)

import Foundation

// MARK: - ResponseDriverStandings

struct ResponseDriverStandings: Codable {
    let mrData: ResponseMRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

// MARK: - ResponseMRData

struct ResponseMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let standingsTable: ResponseStandingsTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case standingsTable = "StandingsTable"
    }
}

// MARK: - ResponseStandingsTable

struct ResponseStandingsTable: Codable {
    let season: String
    let standingsLists: [ResponseStandingsList]

    enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}

// MARK: - ResponseStandingsList

struct ResponseStandingsList: Codable {
    let season, round: String
    let driverStandings: [ResponseDriverStanding]

    enum CodingKeys: String, CodingKey {
        case season, round
        case driverStandings = "DriverStandings"
    }
}

// MARK: - ResponseDriverStanding

struct ResponseDriverStanding: Codable {
    let position, positionText, points, wins: String
    let driver: ResponseDriver
    let constructors: [ResponseConstructor]

    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case driver = "Driver"
        case constructors = "Constructors"
    }
}

// MARK: - ResponseConstructor

struct ResponseConstructor: Codable {
    let constructorId: String
    let url: String
    let name, nationality: String
}

// MARK: - ResponseDriver

struct ResponseDriver: Codable {
    let driverId, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String
}

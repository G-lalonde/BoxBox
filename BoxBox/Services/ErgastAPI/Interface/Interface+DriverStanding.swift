// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseDriverStandings = try? newJSONDecoder().decode(ResponseDriverStandings.self, from: jsonData)

import Foundation

// MARK: - ResponseDriverStandings

struct ResponseDriverStandings: Codable {
    let mrData: ResponseDriverMRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

// MARK: - ResponseDriverMRData

struct ResponseDriverMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let standingsTable: ResponseDriverStandingsTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case standingsTable = "StandingsTable"
    }
}

// MARK: - ResponseDriverStandingsTable

struct ResponseDriverStandingsTable: Codable {
    let season: String
    let standingsLists: [ResponseDriverStandingsList]

    enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}

// MARK: - ResponseDriverStandingsList

struct ResponseDriverStandingsList: Codable {
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

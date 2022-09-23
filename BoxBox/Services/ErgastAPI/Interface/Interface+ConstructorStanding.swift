// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseConstructorStandings = try? newJSONDecoder().decode(ResponseConstructorStandings.self, from: jsonData)

import Foundation

// MARK: - ResponseConstructorStandings

struct ResponseConstructorStandings: Codable {
    let mrData: ResponseConstructorMRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

// MARK: - ResponseConstructorMRData

struct ResponseConstructorMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let standingsTable: ResponseConstructorStandingsTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case standingsTable = "StandingsTable"
    }
}

// MARK: - ResponseConstructorStandingsTable

struct ResponseConstructorStandingsTable: Codable {
    let season: String
    let standingsLists: [ResponseConstructorStandingsList]

    enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}

// MARK: - ResponseConstructorStandingsList

struct ResponseConstructorStandingsList: Codable {
    let season, round: String
    let constructorStandings: [ResponseConstructorStanding]

    enum CodingKeys: String, CodingKey {
        case season, round
        case constructorStandings = "ConstructorStandings"
    }
}

// MARK: - ResponseConstructorStanding

struct ResponseConstructorStanding: Codable {
    let position, positionText, points, wins: String
    let constructor: ResponseConstructor

    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case constructor = "Constructor"
    }
}

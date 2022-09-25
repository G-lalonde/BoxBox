// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseCurrentSchedule = try? newJSONDecoder().decode(ResponseCurrentSchedule.self, from: jsonData)

import Foundation

// MARK: - ResponseCurrentSchedule

struct ResponseCurrentSchedule: Codable {
    let mrData: ResponseCurrentScheduleMRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

// MARK: - ResponseMRData

struct ResponseCurrentScheduleMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: ResponseCurrentScheduleRaceTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

// MARK: - ResponseRaceTable

struct ResponseCurrentScheduleRaceTable: Codable {
    let season: String
    let races: [ResponseCurrentScheduleRace]

    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}

// MARK: - ResponseRace

struct ResponseCurrentScheduleRace: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: ResponseCircuit
    let date, time: String
    let firstPractice, secondPractice: ResponseRaceTime
    let thirdPractice: ResponseRaceTime?
    let qualifying: ResponseRaceTime
    let sprint: ResponseRaceTime?

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case firstPractice = "FirstPractice"
        case secondPractice = "SecondPractice"
        case thirdPractice = "ThirdPractice"
        case qualifying = "Qualifying"
        case sprint = "Sprint"
    }
}

// MARK: - ResponseCircuit

struct ResponseCircuit: Codable {
    let circuitId: String
    let url: String
    let circuitName: String
    let location: ResponseLocation

    enum CodingKeys: String, CodingKey {
        case circuitId, url, circuitName
        case location = "Location"
    }
}

// MARK: - ResponseLocation

struct ResponseLocation: Codable {
    let lat, long, locality, country: String
}

// MARK: - ResponseRaceTime

struct ResponseRaceTime: Codable {
    let date, time: String
}

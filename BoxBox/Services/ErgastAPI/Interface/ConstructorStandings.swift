//
//  ConstructorStandings.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-22.
//

import Foundation

extension ErgastInterface {
    enum ConstructorStandings {
        // MARK: - ConstructorStandings

        struct ConstructorStandings: Codable {
            let mrData: MRData

            enum CodingKeys: String, CodingKey {
                case mrData
            }
        }

        // MARK: - MRData

        struct MRData: Codable {
            let xmlns: String
            let series: String
            let url: String
            let limit, offset, total: String
            let standingsTable: StandingsTable

            enum CodingKeys: String, CodingKey {
                case xmlns, series, url, limit, offset, total
                case standingsTable
            }
        }

        // MARK: - StandingsTable

        struct StandingsTable: Codable {
            let season: String
            let standingsLists: [StandingsList]

            enum CodingKeys: String, CodingKey {
                case season
                case standingsLists
            }
        }

        // MARK: - StandingsList

        struct StandingsList: Codable {
            let season, round: String
            let constructorStandings: [ConstructorStanding]

            enum CodingKeys: String, CodingKey {
                case season, round
                case constructorStandings
            }
        }

        // MARK: - ConstructorStanding

        struct ConstructorStanding: Codable {
            let position, positionText, points, wins: String
            let constructor: Constructor

            enum CodingKeys: String, CodingKey {
                case position, positionText, points, wins
                case constructor
            }
        }

        // MARK: - Constructor

        struct Constructor: Codable {
            let constructorId: String
            let url: String
            let name, nationality: String
        }
    }
}

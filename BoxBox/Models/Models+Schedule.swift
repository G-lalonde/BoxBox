//
//  Models+Schedule.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

import Foundation

extension Models {
    struct Schedule: Hashable {
        let season: String
        let round: String
        let url: String
        let raceName: String
        let circuit: Models.Circuit
        let raceTime: RaceTime
        let fp1: RaceTime
        let fp2: RaceTime
        let fp3: RaceTime?
        let sprint: RaceTime?
        let quali: RaceTime

        var isSprint: Bool {
            sprint != nil
        }

        var name: String {
            raceName.replacingOccurrences(of: "Grand Prix", with: "GP")
        }
    }
}

extension Models.Schedule {
    static let mock1 = Models.Schedule(
        season: "2022",
        round: "1",
        url: "http://en.wikipedia.org/wiki/2022_Bahrain_Grand_Prix",
        raceName: "Bahrain Grand Prix",
        circuit: .mock1,
        raceTime: .mock1,
        fp1: .mock1,
        fp2: .mock1,
        fp3: .mock1,
        sprint: nil,
        quali: .mock1
    )

    static let mock2 = Models.Schedule(
        season: "2022",
        round: "2",
        url: "http://en.wikipedia.org/wiki/2022_Saudi_Arabian_Grand_Prix",
        raceName: "Saudi Arabian Grand Prix",
        circuit: .mock2,
        raceTime: .mock2,
        fp1: .mock2,
        fp2: .mock2,
        fp3: .mock2,
        sprint: nil,
        quali: .mock2
    )

    static let mock3 = Models.Schedule(
        season: "2022",
        round: "5",
        url: "http://en.wikipedia.org/wiki/2022_Miami_Grand_Prix",
        raceName: "Miami Grand Prix",
        circuit: .mock3,
        raceTime: .mock3,
        fp1: .mock3,
        fp2: .mock3,
        fp3: nil,
        sprint: .mock3,
        quali: .mock3
    )
}

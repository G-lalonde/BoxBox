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

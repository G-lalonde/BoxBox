//
//  DriverStanding.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-22.
//

import Foundation

extension Models {
    struct DriverStandings: Hashable {
        let position: String
        var positionText: String { position }
        let points: String
        let wins: String
        let driver: Models.Driver
        let constructors: Models.Constructor
    }
}


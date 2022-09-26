//
//  DriverStanding.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-22.
//

import Foundation



extension Models.DriverStandings {
    static let mock1 = Models.DriverStandings(
        position: "1",
        points: "480",
        wins: "12",
        driver: .mock1,
        constructors: .mock1
    )

    static let mock2 = Models.DriverStandings(
        position: "2",
        points: "320",
        wins: "4",
        driver: .mock2,
        constructors: .mock2
    )

    static let mock3 = Models.DriverStandings(
        position: "3",
        points: "110",
        wins: "0",
        driver: .mock3,
        constructors: .mock3
    )
}

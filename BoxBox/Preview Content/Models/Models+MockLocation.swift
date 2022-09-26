//
//  Models+Location.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

import Foundation



extension Models.Location {
    static let mock1 = Models.Location(
        lat: "26.0325",
        long: "50.5106",
        locality: "Sakhir",
        country: "Bahrain"
    )

    static let mock2 = Models.Location(
        lat: "21.6319",
        long: "39.1044",
        locality: "Jeddah",
        country: "Saudi Arabia"
    )

    static let mock3 = Models.Location(
        lat: "25.9581",
        long: "-80.2389",
        locality: "Miami",
        country: "USA"
    )
}

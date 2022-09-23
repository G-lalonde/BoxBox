//
//  Constructor.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-22.
//

import Foundation
import SwiftUI

extension Models {
    struct ConstructorStanding: Hashable {
        let position: String
        let positionText: String
        let points: String
        let wins: String
        let constructor: Constructor
    }
}

extension Models.ConstructorStanding {
    static let mock1 = Models.ConstructorStanding(
        position: "1",
        positionText: "1",
        points: "545",
        wins: "12",
        constructor: .mock1
    )

    static let mock2 = Models.ConstructorStanding(
        position: "2",
        positionText: "2",
        points: "406",
        wins: "4",
        constructor: .mock2
    )

    static let mock3 = Models.ConstructorStanding(
        position: "3",
        positionText: "3",
        points: "371",
        wins: "0",
        constructor: .mock3
    )
}

extension Models {
    struct Constructor: Hashable {
        let constructorId: String
        let url: String
        let name: String
        let nationality: String
        var color: Color {
            switch constructorId {
                case "red_bull":
                    return Color(hex: "0500E5")
                case "ferrari":
                    return Color(hex: "CA2B1D")
                case "mercedes":
                    return Color(hex: "5FCFBE")
                case "alpine":
                    return Color(hex: "3F8EF7")
                case "mclaren":
                    return Color(hex: "EF8D34")
                case "alfa":
                    return Color(hex: "84180F")
                case "haas":
                    return Color(hex: "787878")
                case "alphatauri":
                    return Color(hex: "314460")
                case "aston_martin":
                    return Color(hex: "2F6D62")
                case "williams":
                    return Color(hex: "2559F6")
                default:
                    return Color(hex: "5E1CEB")
            }
        }
    }
}

extension Models.Constructor {
    static let mock1 = Models.Constructor(
        constructorId: "red_bull",
        url: "http://en.wikipedia.org/wiki/Red_Bull_Racing",
        name: "Red Bull",
        nationality: "Austrian"
    )

    static let mock2 = Models.Constructor(
        constructorId: "ferrari",
        url: "http://en.wikipedia.org/wiki/Scuderia_Ferrari",
        name: "Ferrari",
        nationality: "Italian"
    )

    static let mock3 = Models.Constructor(
        constructorId: "mercedes",
        url: "http://en.wikipedia.org/wiki/Mercedes-Benz_in_Formula_One",
        name: "Mercedes",
        nationality: "German"
    )
}

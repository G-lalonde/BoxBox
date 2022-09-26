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

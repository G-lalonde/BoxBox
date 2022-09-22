//
//  Constructor.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-22.
//

import Foundation

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
        let name, nationality: String
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

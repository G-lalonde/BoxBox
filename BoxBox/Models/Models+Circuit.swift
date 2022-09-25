//
//  Models+Circuit.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

import Foundation

extension Models {
    struct Circuit: Hashable {
        let circuitId: String
        let url: String
        let circuitName: String
        let location: Models.Location
    }
}

extension Models.Circuit {
    static let mock1 = Models.Circuit(
        circuitId: "bahrain",
        url: "http://en.wikipedia.org/wiki/Bahrain_International_Circuit",
        circuitName: "Bahrain International Circuit",
        location: .mock1
    )

    static let mock2 = Models.Circuit(
        circuitId: "jeddah",
        url: "http://en.wikipedia.org/wiki/Jeddah_Street_Circuit",
        circuitName: "Jeddah Corniche Circuit",
        location: .mock2
    )

    static let mock3 = Models.Circuit(
        circuitId: "miami",
        url: "http://en.wikipedia.org/wiki/Miami_International_Autodrome",
        circuitName: "Miami International Autodrome",
        location: .mock3
    )
}

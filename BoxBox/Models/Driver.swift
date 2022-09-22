//
//  Driver.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

struct Driver: Codable {
    let driverId: String
    let permanentNumber: String
    let code: String
    let url: String
    let givenName: String
    let familyName: String
    let dateOfBirth: String
    let nationality: String
}

extension Driver {
    static let mock1 = Driver(
        driverId: "jeremy",
        permanentNumber: "99",
        code: "JAY",
        url: "https://example.com",
        givenName: "Jérémy",
        familyName: "Lalonde",
        dateOfBirth: "1998-02-12",
        nationality: "Canadian"
    )

    static let mock2 = Driver(
        driverId: "daniel",
        permanentNumber: "3",
        code: "RIC",
        url: "https://example.com",
        givenName: "Daniel",
        familyName: "Ricirardo",
        dateOfBirth: "1998-02-12",
        nationality: "Australien"
    )

    static let mock3 = Driver(
        driverId: "max",
        permanentNumber: "1",
        code: "VER",
        url: "https://example.com",
        givenName: "Max",
        familyName: "Verstapen",
        dateOfBirth: "1998-02-12",
        nationality: "Dutch"
    )
}
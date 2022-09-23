//
//  Interface+Common.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-23.
//

import Foundation

// MARK: - ResponseConstructor

struct ResponseConstructor: Codable {
    let constructorId: String
    let url: String
    let name, nationality: String
}

// MARK: - ResponseDriver

struct ResponseDriver: Codable {
    let driverId, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String
}

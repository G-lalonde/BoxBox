//
//  ErgastUrls.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

class ErgastUrls {
    private static let SCHEME = "https"
    private static let HOST = "ergast.com"

    static func drivers(year: Int) -> URL {
        var components = URLComponents()
        components.scheme = SCHEME
        components.host = HOST
        components.path = "/api/f1/\(year)/drivers.json"

        guard let url = components.url else {
            preconditionFailure("Failed to construct \(#function) url")
        }

        return url
    }

    static func constructorStandings() -> URL {
        var components = URLComponents()
        components.scheme = SCHEME
        components.host = HOST
        components.path = "/api/f1/current/constructorStandings.json"

        guard let url = components.url else {
            preconditionFailure("Failed to construct \(#function) url")
        }

        return url
    }
}

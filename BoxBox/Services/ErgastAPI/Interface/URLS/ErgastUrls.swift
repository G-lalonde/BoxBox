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

    static func driverStanding() -> URL {
        var components = URLComponents()
        components.scheme = SCHEME
        components.host = HOST
        components.path = "/api/f1/current/driverStandings.json"

        guard let url = components.url else {
            preconditionFailure("Failed to construct \(#function) url")
        }

        return url
    }
}

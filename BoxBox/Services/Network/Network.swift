//
//  Network.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

class Network {
    static let shared = Network()

    func requestAsync<T: Decodable>(for url: URL) async throws -> T {
        print("🌐 Fetching: \(url)")
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(T.self, from: data)
        print("🌐 Response: \(response)")
        return response
    }

    private init() { }
}

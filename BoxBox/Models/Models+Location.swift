//
//  Models+Location.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

import Foundation

extension Models {
    struct Location: Hashable {
        let lat: String
        let long: String
        let locality: String
        let country: String
    }
}

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

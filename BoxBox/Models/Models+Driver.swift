//
//  Driver.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

extension Models {
    struct Driver: Hashable {
        let driverId: String
        let permanentNumber: String
        let code: String
        let url: String
        let givenName: String
        let familyName: String
        let dateOfBirth: String
        let nationality: String
    }
}

//
//  Drivers+ViewState.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

extension Standing.View.ViewModel {
    enum ViewState {
        case loading
        case loaded(StandingData)
        case error
    }
}

extension Standing.View.ViewModel {
    struct StandingData {
        let driver: [Models.DriverStandings]
        let constructor: [Models.ConstructorStanding]
    }
}

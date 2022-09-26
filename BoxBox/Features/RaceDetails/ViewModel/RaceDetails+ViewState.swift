//
//  Drivers+ViewState.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

extension RaceDetails.View.ViewModel {
    enum ViewState {
        case loading
        case loaded(Models.Schedule)
        case error
    }
}

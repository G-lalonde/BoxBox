//
//  Drivers+ViewModel.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension RaceDetails.View {
    final class ViewModel: ObservableObject, Emitable {
        @Published public internal(set) var state: RaceDetails.View.ViewModel.ViewState

        let api: DriverApi
        let race: Models.Schedule

        init(api: DriverApi, race: Models.Schedule) {
            state = .loading
            self.api = api
            self.race = race

            emit(state: .loaded(race))
        }
    }
}

//
//  Drivers+ViewModel.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension Standing.View {
    final class ViewModel: ObservableObject, Emitable {
        @Published public internal(set) var state: Standing.View.ViewModel.ViewState

        let api: DriverApi

        init(api: DriverApi) {
            state = .loading
            self.api = api
        }

        func fetchDriver() async {
            emit(state: .loading)
            do {
                let driverStandings = try await api.getDriverStanding()
                let constructorStandings = try await api.getConstructorStanding()

                emit(state: .loaded(.init(
                    driver: driverStandings,
                    constructor: constructorStandings
                )))
            } catch {
                emit(state: .error)
            }
        }
    }
}

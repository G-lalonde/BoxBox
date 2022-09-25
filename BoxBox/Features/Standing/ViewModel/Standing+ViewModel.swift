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

        let network: Network
        let api: DriverApi

        init(network: Network, api: DriverApi) {
            state = .loading
            self.network = network
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

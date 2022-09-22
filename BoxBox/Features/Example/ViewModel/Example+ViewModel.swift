//
//  Example+ViewModel.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension Example.View {
    @MainActor final class ViewModel: ObservableObject {
        @Published public internal(set) var state: ViewState

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
                let drivers = try await api.getDrivers(year: 2_022)
                emit(state: .loaded(drivers.first!))
            } catch {
                emit(state: .error)
            }
        }

        func changeDriver() async {
            emit(state: .loading)
            do {
                let drivers = try await api.getDrivers(year: 2_022)
                emit(state: .loaded(drivers.randomElement()!))
            } catch {
                emit(state: .error)
            }
        }

        private func emit(state: ViewState) {
            withAnimation {
                self.state = state
            }
        }
    }
}

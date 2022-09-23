//
//  Drivers+ViewModel.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension Standing.View {
    final class ViewModel: ObservableObject {
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
                let constructorStanding = try await api.getDriverStanding()
                emit(state: .loaded(constructorStanding))
            } catch {
                emit(state: .error)
            }
        }

        func emit(state: Standing.View.ViewModel.ViewState) {
            DispatchQueue.main.async {
                withAnimation {
                    self.state = state
                }
            }
        }
    }
}

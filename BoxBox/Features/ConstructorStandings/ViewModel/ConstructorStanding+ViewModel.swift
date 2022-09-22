//
//  ConstructorStanding+ViewModel.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension ConstructorStanding.View {
    @MainActor final class ViewModel: ObservableObject {
        @Published public internal(set) var state: ViewState

        let network: Network
        let api: DriverApi

        init(network: Network, api: DriverApi) {
            state = .loading
            self.network = network
            self.api = api
        }

        func fetchConstructors() async {
            emit(state: .loading)
            do {
                let constructorStanding = try await api.getConstructorStandings()
                emit(state: .loaded(constructorStanding))
            } catch {
                emit(state: .error)
            }
        }

        func emit(state: ViewState) {
            withAnimation {
                self.state = state
            }
        }
    }
}

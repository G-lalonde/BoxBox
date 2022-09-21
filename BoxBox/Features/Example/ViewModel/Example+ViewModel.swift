//
//  Example+ViewModel.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension ExampleRootView {
    @MainActor final class ViewModel: ObservableObject {
        @Published public internal(set) var state: ViewState

        init() {
            state = .loading
        }

        func fetchDriver() async {
            let newDriver = Driver(name: "Charles", points: 300)
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            emit(state: .loaded(newDriver))
        }

        func changeDriver() async {
            emit(state: .loading)
            let newDriver = Driver(name: "Max", points: 350)
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            emit(state: .loaded(newDriver))
        }

        private func emit(state: ViewState) {
            withAnimation {
                self.state = state
            }
        }
    }
}

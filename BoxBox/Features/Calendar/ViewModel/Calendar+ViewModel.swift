//
//  Drivers+ViewModel.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension Calendar.View {
    final class ViewModel: ObservableObject {
        @Published public internal(set) var state: Calendar.View.ViewModel.ViewState

        let network: Network
        let api: DriverApi

        init(network: Network, api: DriverApi) {
            state = .loading
            self.network = network
            self.api = api
        }

        func fetchCalendar() async {
            emit(state: .loading)

            do {
                let schedules = try await api.getCurrentSchedule()
                emit(state: .loaded(schedules))
            } catch {
                emit(state: .error)
            }
        }

        func emit(state: Calendar.View.ViewModel.ViewState) {
            DispatchQueue.main.async {
                withAnimation {
                    self.state = state
                }
            }
        }
    }
}

//
//  Drivers+ViewModel.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension Calendar.View {
    final class ViewModel: ObservableObject, Emitable {
        @Published public internal(set) var state: Calendar.View.ViewModel.ViewState

        let api: DriverApi

        init(api: DriverApi) {
            state = .loading
            self.api = api
        }

        func fetchCalendar() async {
            emit(state: .loading, withAnimation: false)

            do {
                let schedules = try await api.getCurrentSchedule()
                emit(state: .loaded(schedules), withAnimation: false)
            } catch {
                emit(state: .error)
            }
        }
    }
}

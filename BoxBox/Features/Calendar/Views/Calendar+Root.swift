//
//  Drivers+Root.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension Calendar.View {
    struct Root: View {
        @ObservedObject var viewModel: Calendar.View.ViewModel
        let viewFactory: ViewFactory.Factory

        var body: some View {
            NavigationView {
                ScrollView {
                    makeView(basedOn: viewModel.state)
                        .task {
                            await viewModel.fetchCalendar()
                        }
                }
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "C7C9CB"))
                .navigationTitle("Calendar")
            }
        }

        @ViewBuilder func makeView(basedOn state: Calendar.View.ViewModel.ViewState) -> some View {
            switch state {
                case .loading:
                    loadingView()
                case let .loaded(schedule):
                    loadedView(calendar: schedule)
                case .error:
                    loadingView()
            }
        }

        func loadingView() -> some View {
            ProgressView()
                .padding()
        }

        func loadedView(calendar: [Models.Schedule]) -> some View {
            ForEach(calendar, id: \.self) { race in
                Text(race.raceName)
            }
        }
    }
}

struct CalendarRootView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory.Factory(assembly: Assemblies.forPreview)

    static var previews: some View {
        viewFactory.makeView(id: .calendar)
    }
}

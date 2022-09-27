//
//  Drivers+Root.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension RaceDetails.View {
    struct Root: View {
        @ObservedObject var viewModel: RaceDetails.View.ViewModel
        let viewFactory: ViewFactory.Factory

        var body: some View {
            ScrollView {
                makeView(basedOn: viewModel.state)
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "C7C9CB"))
            .navigationTitle(viewModel.race.name)
        }

        @ViewBuilder func makeView(
            basedOn state: RaceDetails.View.ViewModel.ViewState
        ) -> some View {
            switch state {
                case .loading:
                    loadingView()
                case let .loaded(race):
                    loadedView(raceDetails: race)
                case .error:
                    loadingView()
            }
        }

        func loadingView() -> some View {
            ProgressView()
                .padding()
        }

        func loadedView(raceDetails: Models.Schedule) -> some View {
            VStack {
                RaceDetails.View.SessionSchedule(
                    race: raceDetails,
                    time: raceDetails.fp1,
                    sessionType: .fp1
                )
                RaceDetails.View.SessionSchedule(
                    race: raceDetails,
                    time: raceDetails.fp2,
                    sessionType: .fp2
                )
                if let fp3 = raceDetails.fp3 {
                    RaceDetails.View.SessionSchedule(
                        race: raceDetails,
                        time: fp3,
                        sessionType: .fp2
                    )
                }
                RaceDetails.View.SessionSchedule(
                    race: raceDetails,
                    time: raceDetails.quali,
                    sessionType: .quali
                )
                if let sprint = raceDetails.sprint {
                    RaceDetails.View.SessionSchedule(
                        race: raceDetails,
                        time: sprint,
                        sessionType: .sprint
                    )
                }
                RaceDetails.View.SessionSchedule(
                    race: raceDetails,
                    time: raceDetails.raceTime,
                    sessionType: .race
                )
            }
        }
    }
}

enum SessionType: String, CaseIterable, Identifiable {
    case fp1 = "First Practice"
    case fp2 = "Second Practice"
    case fp3 = "Third Practice"
    case quali = "Qualifying"
    case sprint = "Sprint Race"
    case race = "Race"

    var id: String { rawValue }
}

struct RaceDetailsRootView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory.Factory(assembly: Assemblies.forPreview)

    static var previews: some View {
        NavigationView {
            viewFactory.makeView(id: .raceDetails(.mock1))
        }
    }
}

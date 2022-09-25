//
//  Drivers+Root.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

enum StandingsType: String, CaseIterable, Identifiable {
    case driver
    case constructor

    var id: String { rawValue }
}

extension Standing.View {
    struct Root: View {
        @ObservedObject var viewModel: Standing.View.ViewModel
        let viewFactory: ViewFactory.Factory

        @State private var selectedStanding: StandingsType = .driver

        var body: some View {
            NavigationView {
                ScrollView {
                    Picker("Please choose a color", selection: $selectedStanding) {
                        ForEach(StandingsType.allCases, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()

                    makeView(basedOn: viewModel.state)
                        .task {
                            await viewModel.fetchDriver()
                        }
                }
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "C7C9CB"))
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Standings")
            }
        }

        @ViewBuilder func makeView(basedOn state: Standing.View.ViewModel.ViewState) -> some View {
            switch state {
                case .loading:
                    loadingView()
                case let .loaded(drivers):
                    loadedView(standing: drivers)
                case .error:
                    loadingView()
            }
        }

        func loadingView() -> some View {
            ProgressView()
                .padding()
        }

        @ViewBuilder func loadedView(standing: Standing.View.ViewModel.StandingData) -> some View {
            switch selectedStanding {
                case .constructor:
                    ForEach(standing.constructor, id: \.self) { standing in
                        ConstructorStandingCard(standing: standing)
                    }
                case .driver:
                    ForEach(standing.driver, id: \.self) { standing in
                        DriverStandingCard(standing: standing)
                    }
            }
        }
    }
}

struct StandingRootView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory.Factory(assembly: Assemblies.forPreview)

    static var previews: some View {
        viewFactory.makeView(id: .standing)
    }
}

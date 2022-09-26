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
            Text(raceDetails.circuit.circuitName)
        }
    }
}

struct RaceDetailsRootView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory.Factory(assembly: Assemblies.forPreview)

    static var previews: some View {
        NavigationView {
            viewFactory.makeView(id: .raceDetails(.mock1))
        }
    }
}

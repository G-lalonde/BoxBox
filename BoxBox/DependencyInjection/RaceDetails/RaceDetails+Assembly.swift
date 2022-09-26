//
//  RaceDetails+Assembly.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

import Foundation

extension ViewFactory.Assembly.ForRuntime {
    @MainActor func makeRaceDetailsView(
        viewFactory: ViewFactory.Factory,
        raceDetails: Models.Schedule
    ) -> RaceDetails.View.Root {
        let network = Network.shared
        let api = ErgastApi(network: network)

        return RaceDetails.View.Root(
            viewModel: RaceDetails.View.ViewModel(api: api, race: raceDetails),
            viewFactory: viewFactory
        )
    }
}

extension ViewFactory.Assembly.ForPreview {
    @MainActor func makeRaceDetailsView(
        viewFactory: ViewFactory.Factory,
        raceDetails: Models.Schedule
    ) -> RaceDetails.View.Root {
        let api = ErgastMockApi()

        return RaceDetails.View.Root(
            viewModel: RaceDetails.View.ViewModel(api: api, race: raceDetails),
            viewFactory: viewFactory
        )
    }
}

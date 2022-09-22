//
//  Drivers+Assembly.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

extension ViewFactory.Assembly.ForRuntime {
    @MainActor func makeDriversView(
        viewFactory: ViewFactory.Factory
    ) -> Drivers.View.Root {
        let network = Network()
        let api = ErgastApi(network: network)

        return Drivers.View.Root(
            viewModel: Drivers.View.ViewModel(
                network: network,
                api: api
            ),
            viewFactory: viewFactory
        )
    }
}

extension ViewFactory.Assembly.ForPreview {
    @MainActor func makeDriversView(
        viewFactory: ViewFactory.Factory
    ) -> Drivers.View.Root {
        let network = Network()
        let api = ErgastMockApi(network: network)

        return Drivers.View.Root(
            viewModel: Drivers.View.ViewModel(
                network: network,
                api: api
            ),
            viewFactory: viewFactory
        )
    }
}

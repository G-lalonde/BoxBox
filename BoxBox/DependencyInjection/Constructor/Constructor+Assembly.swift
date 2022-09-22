//
//  Drivers+Assembly.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

extension ViewFactory.Assembly.ForRuntime {
    @MainActor func makeConstructorView(
        viewFactory: ViewFactory.Factory
    ) -> ConstructorStanding.View.Root {
        let network = Network.shared
        let api = ErgastApi(network: network)

        return ConstructorStanding.View.Root(
            viewModel: ConstructorStanding.View.ViewModel(
                network: network,
                api: api
            ),
            viewFactory: viewFactory
        )
    }
}

extension ViewFactory.Assembly.ForPreview {
    @MainActor func makeConstructorView(
        viewFactory: ViewFactory.Factory
    ) -> ConstructorStanding.View.Root {
        let network = Network.shared
        let api = ErgastMockApi(network: network)

        return ConstructorStanding.View.Root(
            viewModel: ConstructorStanding.View.ViewModel(
                network: network,
                api: api
            ),
            viewFactory: viewFactory
        )
    }
}

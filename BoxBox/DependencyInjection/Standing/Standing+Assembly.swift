//
//  Standing+Assembly.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

extension ViewFactory.Assembly.ForRuntime {
    @MainActor func makeStandingView(
        viewFactory: ViewFactory.Factory
    ) -> Standing.View.Root {
        let network = Network.shared
        let api = ErgastApi(network: network)

        return Standing.View.Root(
            viewModel: Standing.View.ViewModel(api: api),
            viewFactory: viewFactory
        )
    }
}

extension ViewFactory.Assembly.ForPreview {
    @MainActor func makeStandingView(
        viewFactory: ViewFactory.Factory
    ) -> Standing.View.Root {
        let api = ErgastMockApi()

        return Standing.View.Root(
            viewModel: Standing.View.ViewModel(api: api),
            viewFactory: viewFactory
        )
    }
}

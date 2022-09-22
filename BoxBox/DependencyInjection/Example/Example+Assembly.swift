//
//  ExampleAssembly.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

extension ViewFactory.Assembly.ForRuntime {
    @MainActor func makeExampleView(
        viewFactory: ViewFactory.Factory
    ) -> Example.View.Root {
        let network = Network()
        let api = ErgastApi(network: network)

        return Example.View.Root(
            viewModel: Example.View.ViewModel(
                network: network,
                api: api
            ),
            viewFactory: viewFactory
        )
    }
}

extension ViewFactory.Assembly.ForPreview {
    @MainActor func makeExampleView(
        viewFactory: ViewFactory.Factory
    ) -> Example.View.Root {
        let network = Network()
        let api = ErgastMockApi(network: network)

        return Example.View.Root(
            viewModel: Example.View.ViewModel(
                network: network,
                api: api
            ),
            viewFactory: viewFactory
        )
    }
}

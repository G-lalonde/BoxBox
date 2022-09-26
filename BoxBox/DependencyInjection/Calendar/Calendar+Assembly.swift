//
//  Calendar+Assembly.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

import Foundation

extension ViewFactory.Assembly.ForRuntime {
    @MainActor func makeCalendarView(
        viewFactory: ViewFactory.Factory
    ) -> Calendar.View.Root {
        let network = Network.shared
        let api = ErgastApi(network: network)

        return Calendar.View.Root(
            viewModel: Calendar.View.ViewModel(
                api: api
            ),
            viewFactory: viewFactory
        )
    }
}

extension ViewFactory.Assembly.ForPreview {
    @MainActor func makeCalendarView(
        viewFactory: ViewFactory.Factory
    ) -> Calendar.View.Root {
        let api = ErgastMockApi()

        return Calendar.View.Root(
            viewModel: Calendar.View.ViewModel(
                api: api
            ),
            viewFactory: viewFactory
        )
    }
}

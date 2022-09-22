//
//  Drivers+Root.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension Drivers.View {
    struct Root: View {
        @ObservedObject var viewModel: ViewModel
        let viewFactory: ViewFactory.Factory

        var body: some View {
            NavigationView {
                makeView(basedOn: viewModel.state)
                    .task {
                        await viewModel.fetchDriver()
                    }
                    .navigationTitle("Drivers")
            }
        }

        @ViewBuilder func makeView(basedOn state: ViewModel.ViewState) -> some View {
            switch state {
                case .loading:
                    loadingView()
                case let .loaded(drivers):
                    loadedView(drivers: drivers)
                case .error:
                    loadingView()
            }
        }

        func loadingView() -> some View {
            ProgressView()
                .padding()
        }

        func loadedView(drivers: [Models.Driver]) -> some View {
            ScrollView {
                ForEach(drivers, id: \.code) { driver in
                    Text(driver.code)
                }
            }
        }
    }
}

struct DriversRootView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory.Factory(
        assembly: ViewFactory.Assembly.ForPreview()
    )

    static var previews: some View {
        viewFactory.makeView(id: .example)
    }
}

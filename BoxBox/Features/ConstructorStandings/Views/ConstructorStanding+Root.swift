//
//  ConstructorStanding+Root.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension ConstructorStanding.View {
    struct Root: View {
        @ObservedObject var viewModel: ViewModel
        let viewFactory: ViewFactory.Factory

        var body: some View {
            NavigationView {
                makeView(basedOn: viewModel.state)
                    .task {
                        await viewModel.fetchConstructors()
                    }
                    .navigationTitle("ConstructorStanding")
            }
        }

        @ViewBuilder func makeView(basedOn state: ViewModel.ViewState) -> some View {
            switch state {
                case .loading:
                    loadingView()
                case let .loaded(constructorStanding):
                    loadedView(constructorStanding: constructorStanding)
                case .error:
                    loadingView()
            }
        }

        func loadingView() -> some View {
            ProgressView()
                .padding()
        }

        func loadedView(constructorStanding: [Models.ConstructorStanding]) -> some View {
            ScrollView {
                ForEach(constructorStanding, id: \.constructor) { constructor in
                    Text(constructor.constructor.name)
                }
            }
        }
    }
}

struct ConstructorStandingRootView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory.Factory(
        assembly: ViewFactory.Assembly.ForPreview()
    )

    static var previews: some View {
        viewFactory.makeView(id: .example)
    }
}

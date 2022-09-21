//
//  Example+Root.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

struct ExampleRootView: View {
    @ObservedObject var viewModel: ExampleRootView.ViewModel

    var body: some View {
        makeView(basedOn: viewModel.state)
            .task {
                await viewModel.fetchDriver()
            }
    }

    @ViewBuilder func makeView(basedOn state: ExampleRootView.ViewModel.ViewState) -> some View {
        switch state {
            case .loading:
                loadingView()
            case let .loaded(driver):
                loadedView(driver: driver)
            case .error:
                loadingView()
        }
    }

    func loadingView() -> some View {
        ProgressView()
            .padding()
    }

    func loadedView(driver: Driver) -> some View {
        VStack {
            Text(driver.code)
            Text(driver.givenName)
            Text(driver.familyName)
            Button {
                Task {
                    await viewModel.changeDriver()
                }
            } label: {
                Text("Change")
            }
        }
        .padding()
    }
}

struct ExampleRootView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleRootView(viewModel: .init())
    }
}

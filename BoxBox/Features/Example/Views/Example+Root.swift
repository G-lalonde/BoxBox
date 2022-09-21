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
        }
    }

    func loadingView() -> some View {
        ProgressView()
            .padding()
    }

    func loadedView(driver: ExampleRootView.ViewModel.Driver) -> some View {
        VStack {
            Text("Hello, world!")
            Text(driver.name)
            Text("\(driver.points)")
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

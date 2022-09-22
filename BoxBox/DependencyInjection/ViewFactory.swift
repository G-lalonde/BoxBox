//
//  ViewFactory.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

struct ViewFactory {
    enum ViewId {
        case example
        case drivers
        case constructor
    }
}

extension ViewFactory {
    struct Factory {
        let assembly: ViewFactoryAssembly

        @MainActor
        @ViewBuilder
        func makeView(id: ViewId) -> some View {
            switch id {
                case .example:
                    assembly.makeExampleView(viewFactory: self)
                case .drivers:
                    assembly.makeDriversView(viewFactory: self)
                case .constructor:
                    assembly.makeConstructorView(viewFactory: self)
            }
        }
    }
}

protocol ViewFactoryAssembly {
    @MainActor func makeExampleView(viewFactory: ViewFactory.Factory) -> Example.View.Root
    @MainActor func makeDriversView(viewFactory: ViewFactory.Factory) -> Drivers.View.Root
    @MainActor func makeConstructorView(viewFactory: ViewFactory.Factory) -> ConstructorStanding
        .View.Root
}

extension ViewFactory {
    enum Assembly {
        struct ForRuntime: ViewFactoryAssembly {}
        struct ForPreview: ViewFactoryAssembly {}
    }
}

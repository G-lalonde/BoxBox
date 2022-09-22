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
    }
}

extension ViewFactory {
    struct Factory {
        let assembly: ViewFactoryAssembly

        @MainActor func makeView(id: ViewId) -> some View {
            switch id {
                case .example:
                    return assembly.makeExampleView(viewFactory: self)
            }
        }
    }
}

protocol ViewFactoryAssembly {
    @MainActor func makeExampleView(
        viewFactory: ViewFactory.Factory
    ) -> Example.View.Root
}

extension ViewFactory {
    enum Assembly {
        struct ForRuntime: ViewFactoryAssembly {}
        struct ForPreview: ViewFactoryAssembly {}
    }
}

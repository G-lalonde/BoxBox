//
//  ViewFactory.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

struct ViewFactory {
    enum ViewId {
        case standing
    }
}

protocol ViewFactoryAssembly {
    func makeStandingView(viewFactory: ViewFactory.Factory) -> Standing.View.Root
}

extension ViewFactory {
    struct Factory {
        let assembly: ViewFactoryAssembly

        @ViewBuilder
        func makeView(id: ViewId) -> some View {
            switch id {
                case .standing:
                    assembly.makeStandingView(viewFactory: self)
            }
        }
    }
}

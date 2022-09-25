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
        case calendar
    }
}

protocol ViewFactoryAssembly {
    func makeStandingView(viewFactory: ViewFactory.Factory) -> Standing.View.Root
    func makeCalendarView(viewFactory: ViewFactory.Factory) -> Calendar.View.Root
}

extension ViewFactory {
    struct Factory {
        let assembly: ViewFactoryAssembly

        @ViewBuilder
        func makeView(id: ViewId) -> some View {
            switch id {
                case .standing:
                    assembly.makeStandingView(viewFactory: self)
                case .calendar:
                    assembly.makeCalendarView(viewFactory: self)
            }
        }
    }
}

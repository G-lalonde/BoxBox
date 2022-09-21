//
//  Example+ViewState.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

extension ExampleRootView.ViewModel {
    enum ViewState: Equatable, Hashable {
        case loading
        case loaded(Driver)
    }

    struct Driver: Equatable, Hashable {
        let name: String
        let points: Int
    }
}

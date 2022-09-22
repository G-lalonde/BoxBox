//
//  Example+ViewState.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import Foundation

extension Example.View.ViewModel {
    enum ViewState {
        case loading
        case loaded(Driver)
        case error
    }
}

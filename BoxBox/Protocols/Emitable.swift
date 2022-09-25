//
//  Emitable.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

import SwiftUI

protocol Emitable: AnyObject {
    associatedtype State
    var state: State { get set }
    func emit(state: State)
}

extension Emitable {
    func emit(state: State) {
        DispatchQueue.main.async {
            withAnimation {
                self.state = state
            }
        }
    }
}

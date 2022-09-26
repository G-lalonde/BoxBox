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
    func emit(state: State, withAnimation: Bool)
}

extension Emitable {
    func emit(state: State, withAnimation: Bool = true) {
        DispatchQueue.main.async {
            if withAnimation {
                SwiftUI.withAnimation {
                    self.state = state
                }
            } else {
                self.state = state
            }
        }
    }
}

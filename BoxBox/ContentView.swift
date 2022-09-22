//
//  ContentView.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

struct ContentView: View {
    let viewFactory = ViewFactory.Factory(
        assembly: ViewFactory.Assembly.ForRuntime()
    )

    var body: some View {
        viewFactory.makeView(id: .constructor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory.Factory(
        assembly: ViewFactory.Assembly.ForPreview()
    )

    static var previews: some View {
        viewFactory.makeView(id: .example)
    }
}

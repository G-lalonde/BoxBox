//
//  HomeView.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

struct HomeView: View {
    let viewFactory: ViewFactory.Factory

    var body: some View {
        TabView {
            viewFactory.makeView(id: .standing)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            viewFactory.makeView(id: .standing)
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory.Factory(assembly: Assemblies.forPreview)

    static var previews: some View {
        HomeView(viewFactory: viewFactory)
    }
}

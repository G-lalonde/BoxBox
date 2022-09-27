//
//  BoxBoxApp.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

@main
struct BoxBoxApp: App {
    let viewFactory = ViewFactory.Factory(assembly: Assemblies.forRuntime)

    var body: some Scene {
        WindowGroup {
            HomeView(viewFactory: viewFactory)
        }
    }
}

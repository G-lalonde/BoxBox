//
//  Common+ViewFactory.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

extension ViewFactory {
    enum Assembly {
        struct ForRuntime: ViewFactoryAssembly {}
        struct ForPreview: ViewFactoryAssembly {}
    }
}

enum Assemblies {
    static let forRuntime: ViewFactoryAssembly = ViewFactory.Assembly.ForRuntime()
    static let forPreview: ViewFactoryAssembly = ViewFactory.Assembly.ForPreview()
}

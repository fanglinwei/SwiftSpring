//
//  SceneDelegate.swift
//  SwiftSpring-SwiftUI-Demo
//
//  Created by OpenAI on 2026/5/29.
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: SpringDemoView())
        self.window = window
        window.makeKeyAndVisible()
    }
}

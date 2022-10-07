//
//  SceneDelegate.swift
//  ProjectNew
//
//  Created by mac on 05.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: TabBarViewController())
        window?.rootViewController = navigationController
    }
}


//
//  SceneDelegate.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 06.10.2022.
//

import UIKit

// MARK: - SceneDelegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let applicationScene = (scene as? UIWindowScene) else { return }
         window?.windowScene = applicationScene
         window?.makeKeyAndVisible()

         let startViewController = ViewController()
         let navigationController = UINavigationController(rootViewController: startViewController)
         window?.rootViewController = navigationController

    }
}

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
        window = UIWindow(windowScene: applicationScene)
        window?.makeKeyAndVisible()
        
        let tabBarViewController = MainTabBarViewController()
        window?.rootViewController = tabBarViewController
    }
}

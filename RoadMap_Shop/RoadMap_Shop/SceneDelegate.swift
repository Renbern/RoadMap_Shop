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
        let tabBarViewController = MainTabBarViewController()
        let onboardingPageViewController = OnboardingPageViewController()
        let defaults = UserDefaults.standard
        defaults.object(forKey: Constants.OnboardingText.userDefaultsKey)
        if defaults.bool(forKey: Constants.OnboardingText.userDefaultsKey) {
            window?.rootViewController = tabBarViewController
        } else {
            window?.rootViewController = onboardingPageViewController
        }
        window?.makeKeyAndVisible()
    }
}

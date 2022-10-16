//
//  TabBarViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 06.10.2022.
//

import UIKit

/// Конфигурация таб бара
final class MainTabBarViewController: UITabBarController {
    
    // MARK: - Private properties
    private let searchVC = SearchViewController()
    private let searchTabBarItem = UITabBarItem(
        title: Constants.TabBarItemText.searchItemText,
        image: UIImage(systemName: Constants.TabBarItemImage.searchItemImage),
        tag: 0
    )
    private let buyVC = BuyViewController()
    private let buyTabBarItem = UITabBarItem(
        title: Constants.TabBarItemText.buyItemText,
        image: UIImage(systemName: Constants.TabBarItemImage.buyItemImage),
        tag: 1
    )
    private let offerVC = OfferViewController()
    private let offerTabBarItem = UITabBarItem(
        title: Constants.TabBarItemText.offerItemText,
        image: UIImage(systemName: Constants.TabBarItemImage.offerItemImage),
        tag: 2
    )
    private let cartVC = CartViewController()
    private let cartTabBarItem = UITabBarItem(
        title: Constants.TabBarItemText.cartItemText,
        image: UIImage(systemName: Constants.TabBarItemImage.cartItemImage),
        tag: 3
    )

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        let searchNavigationController = UINavigationController(rootViewController: searchVC)
        let offerNavigationController = UINavigationController(rootViewController: offerVC)
        
        viewControllers = [buyVC, offerNavigationController, searchNavigationController, cartVC]
        buyVC.tabBarItem = buyTabBarItem
        offerNavigationController.tabBarItem = offerTabBarItem
        searchNavigationController.tabBarItem = searchTabBarItem
        cartVC.tabBarItem = cartTabBarItem
        tabBar.backgroundColor = .systemGray6
        let onboardingVC = OnboardingPageViewController()
        onboardingVC.modalPresentationStyle = .fullScreen
        present(onboardingVC, animated: true)
    }
}

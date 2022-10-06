//
//  TabBarViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 06.10.2022.
//

import UIKit

// MARK: - tabBar
class TabBarViewController: UITabBarController {

    // MARK: - Constants
    private enum Constants {
        enum TabBarItemText {
            static let buyItemText = "Купить"
            static let offerItemText = "Для вас"
            static let searchItemText = "Поиск"
            static let cartItemText = "Корзина"
        }
        enum TabBarItemImage {
            static let buyItemImage = "laptopcomputer.and.iphone"
            static let offerItemImage = "person.circle"
            static let searchItemImage = "magnifyingglass"
            static let cartItemImage = "bag"
        }
    }
    
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
        let navigationController = UINavigationController(rootViewController: searchVC)
        viewControllers = [buyVC, offerVC, navigationController, cartVC]
        buyVC.tabBarItem = buyTabBarItem
        offerVC.tabBarItem = offerTabBarItem
        searchVC.tabBarItem = searchTabBarItem
        cartVC.tabBarItem = cartTabBarItem
        tabBar.backgroundColor = .systemGray6
    }
}

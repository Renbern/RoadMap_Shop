//
//  LoadingViewController.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 13.10.2022.
//

import UIKit

/// Экран загрузки
class LoadingViewController: UIViewController {

    private var isOnboardingSeen = false
    private let navigationManager = NavigationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showInitialScreen()
    }

    func showInitialScreen() {
        if isOnboardingSeen {
            navigationManager.show(screen: .mainApp, inController: self)
        } else {
            navigationManager.show(screen: .onboarding, inController: self)
        }
    }

}

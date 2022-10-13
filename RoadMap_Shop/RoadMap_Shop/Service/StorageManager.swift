//
//  NavigationManager.swift
//  RoadMap_Shop
//
//  Created by Артур Щукин on 13.10.2022.
//

import UIKit

/// manager
class StorageManager {
    
    enum Key: String {
        case onboardingSeen
    }
    
    static func isOnboardingSeen() -> Bool {
        UserDefaults.standard.bool(forKey: Key.onboardingSeen.rawValue)
    }
    
    static func setOnboardingSeen() {
        UserDefaults.standard.set(true, forKey: Key.onboardingSeen.rawValue)
    }
    
}

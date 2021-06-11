//
//  AppRouter.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 11/06/2021.
//

import UIKit

final class AppRouter {

    static let shared = AppRouter()
    
    fileprivate let root = UINavigationController(rootViewController: HomeViewController())

    public func rootController() -> UIViewController {
        root.isNavigationBarHidden = true
        return root
    }
}

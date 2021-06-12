//
//  AppRouter.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 11/06/2021.
//

import UIKit
import CoreLocation
import MapKit

final class AppRouter {

    static let shared = AppRouter()
    
    fileprivate let root = UINavigationController(rootViewController: HomeViewController())

    public func rootController() -> UIViewController {
        root.isNavigationBarHidden = true
        return root
    }
    
    public func presentSearchController() {
        let viewController = UINavigationController(rootViewController: locationSeachViewController())
        root.present(viewController, animated: true, completion: nil)
    }
    
    public func presentSearchResult(_ item: MKMapItem, from nav: UINavigationController?, title: String? = nil) {
        let coordinate: CLLocationCoordinate2D = item.placemark.coordinate
        let viewController = HomeViewController(location: coordinate)
        if let title = title {
            viewController.title = title
        }
        nav?.pushViewController(viewController, animated: true)
    }
}

//
//  HomeViewModel.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 11/06/2021.
//

import UIKit
import CoreLocation

final class HomeViewModel: NSObject {

    fileprivate var _mainImageView: UIImageView
    fileprivate var _currentWeatherLabel: UILabel
    fileprivate var _tableView: UITableView

    fileprivate let locationManager = CLLocationManager()
    fileprivate var weatherForeCastList: [WeatherResult] = []
    fileprivate var todayWeather: WeatherResult?

    init(mainImageView: UIImageView, todayWeatherLabel: UILabel, tableView: UITableView) {
        self._mainImageView = mainImageView
        self._currentWeatherLabel = todayWeatherLabel
        self._tableView = tableView
        super.init()
        self.locationManager.delegate = self

        guard locationManager.authorizationStatus == .notDetermined else {
            locationManager.startUpdatingLocation()
            return
        }
        locationManager.requestWhenInUseAuthorization()
    }

    func numberOfSections()-> Int {
        return 1
    }

    func numberOfRowsInSection()-> Int {
        return 6
    }

    func heightForRowAt(row: Int)-> CGFloat {
        if row == 0 {
            return 50
        }
        return 45
    }

    // Private Methods
    fileprivate func fetchWeatheFor(location: CLLocationCoordinate2D) {
        NetworkManager.shared.get(weatherFor: location) { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let weatherResult):
                    self?._currentWeatherLabel.text = weatherResult.weather.first?.weatherDescription
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    fileprivate func fetchWeatheForeCast(location: CLLocationCoordinate2D) {
        NetworkManager.shared.get(foreCastFor: location) { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let weatherResult):
                    self?.weatherForeCastList = weatherResult.list
                    self?._tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension HomeViewModel:  CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            fetchWeatheFor(location: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            fetchWeatheForeCast(location: CLLocationCoordinate2D(latitude: lat, longitude: lon))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

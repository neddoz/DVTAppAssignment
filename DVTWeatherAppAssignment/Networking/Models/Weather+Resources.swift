//
//  Weather+Resources.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 08/06/2021.
//

import Foundation
import CoreLocation

fileprivate let BASE_URL = "https://api.openweathermap.org/data/2.5/"
fileprivate let API_KEY = "2dada65eab66c7214e270e9a988e4d95"

extension WeatherResult {
    
    static func weather(for location: CLLocationCoordinate2D)-> Resource<WeatherResult>? {
        guard let url = URL(string: ApiResource.weather(location: location).endpoint) else {return nil}
        return Resource(url: url, method: HttpMethod<WeatherResult>.get)
    }
    static func foreCast(for location: CLLocationCoordinate2D)-> Resource<WeatherForeCastList>? {
        guard let url = URL(string: ApiResource.forCastFor(location: location).endpoint) else {return nil}
        return Resource(url: url, method: HttpMethod<WeatherForeCastList>.get)
    }
}

/// Endpoints
enum ApiResource {

    case weather(location: CLLocationCoordinate2D)
    case forCastFor(location: CLLocationCoordinate2D)

    var endpoint: String {
        switch self {
        case .weather(location: let location):
            return "\(BASE_URL)weather?lat=\(location.latitude)&lon=\(location.longitude)&APPID=\(API_KEY )&units=metric"
        case .forCastFor(location: let location):
            return "\(BASE_URL)forecast?lat=\(location.latitude)&lon=\(location.longitude)&APPID=\(API_KEY )&units=metric"
        }
    }
}

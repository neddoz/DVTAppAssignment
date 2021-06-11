//
//  NetworkManager.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 05/06/2021.
//
import  Foundation
import CoreLocation

final class NetworkManager {

    static let shared = NetworkManager()
    
    func get(weatherFor location: CLLocationCoordinate2D, completion: @escaping (Result<WeatherResult, Error> )-> Void){
        guard let resource = WeatherResult.weather(for: location) else {
            completion(.failure(NetworkError.MissingLocation))
            return
        }
        Webservice.load(resource) { result in
            completion(result)
        }
    }
    
    func get(foreCastFor location: CLLocationCoordinate2D, completion: @escaping (Result<WeatherForeCastList, Error> )-> Void) {
        guard let resource = WeatherResult.foreCast(for: location) else {
            completion(.failure(NetworkError.MissingLocation))
            return
        }
        Webservice.load(resource) { result in
            completion(result)
        }
    }
}

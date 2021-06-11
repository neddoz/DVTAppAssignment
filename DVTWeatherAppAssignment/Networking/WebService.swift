//
//  WebService.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 05/06/2021.
//

import Foundation

import Foundation

final class Webservice {
    static func load<A>(_ resource: Resource<A>, completion: @escaping (Result<A, Error>) -> Void) {
        URLSession.shared.dataTask(with: resource.urlRequest) { data, response, error in
            completion(resource.parse(data, response, error))
        }.resume()
    }
}

struct Resource<A> {
    var urlRequest: URLRequest
    let parse: (Data?, URLResponse?, Error?) -> Result<A, Error>
}

extension Resource where A: Decodable {

    init<Body: Encodable>(url: URL, method: HttpMethod<Body>) {
        urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.name

        switch method {
        case .get: ()
        case .post(let body):
            self.urlRequest.httpBody = try! JSONEncoder().encode(body)
        }

        self.parse = { data, response, error in
            guard error == nil else {return .failure(error!)}
            guard response?.status == .success else {return .failure(NetworkError.FailedToGetWeather)}
            do {
                return.success(try JSONDecoder().decode(A.self, from: data!))
            }
            catch {
                return .failure(error)
            }
        }

        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
    }
}

enum JSONError: String, Error {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}

enum HttpMethod<Body> {
    case get
    case post(Body)
}

extension HttpMethod {
    
    var name: String{
        switch self{
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
    
    func map<B>(_ f: (Body) -> B)-> HttpMethod<B>{
        
        switch self {
        case .get:
            return .get
        case .post(let body):
            return .post(f(body))
        }
    }
    
}

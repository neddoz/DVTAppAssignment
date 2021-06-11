//
//  HTTPTask.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 05/06/2021.
//

import Foundation

import Foundation

public typealias Parameters = [String: Any]
public typealias HTTPHeaders = [String: String]

public enum HTTPTask {
    case Request
    case RequestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case RequestFormEncoded(bodyParameters: Parameters)
    case RequestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders?)
}

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError: String, Error {
    case ParametersNil = "Parameters were nil"
    case EncodingFailed = "Parameter encoding failed"
    case MissingURL = "URL is nil"
    case FailedToGetWeather = "Failed to get Weather"
    case MissingLocation = "Missing Location"
}


public enum HTTPMethod: String {
    case Get = "GET"
    case Post = "POST"
    case Put = "PUT"
    case Patch = "PATCH"
    case Delete = "DELETE"
}

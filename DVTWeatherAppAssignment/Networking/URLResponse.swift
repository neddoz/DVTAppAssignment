//
//  URLResponse.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 08/06/2021.
//

import Foundation

extension URLResponse{

    public enum HTTPStatus{
        public enum description{
            case success
            case created
            case badRequest
            case unauthorized
            case forbidden
            case notFound
            case conflict
            case serverError
            case other
        }
        
        case code(Int)
        
        var status: description{
            switch self{
            case .code(200...299):
                return .success
            case .code(400):
                return .badRequest
            case .code(401):
                return .unauthorized
            case .code(403):
                return .forbidden
            case .code(404):
                return .notFound
            case .code(409):
                return .conflict
            case .code(500...599):
                return .serverError
            default:
                return .other
            }
        }
    }
    
    var status: HTTPStatus.description {
        let response = self as? HTTPURLResponse ?? HTTPURLResponse()
        
        let statusCode = HTTPStatus.code(response.statusCode).status
        return statusCode
    }
    
}

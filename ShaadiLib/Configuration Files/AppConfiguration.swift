//
//  AppConfiguration.swift
//  ShaadiLib
//
//  Created by Nelson Thomas Pereira on 20/11/20.
//

import Foundation

internal enum HttpMethod: String {
    case post
    case get
    case put
    case delete
    
    internal var rawValue: String {
        switch self {
        case .post: return "POST"
        case .get: return "GET"
        case .put: return "PUT"
        case .delete: return "DELETE"
        }
    }
}

internal enum BaseURL: String {
    case rootAPI
    
    internal var rawValue: String {
        switch self {
        case .rootAPI: return "https://jsonplaceholder.typicode.com"
        }
    }
}

internal struct AppConfiguration {
    internal let baseURL: BaseURL
    internal let httpMethod: HttpMethod
    
    internal init(baseURL: BaseURL, HTTPMethodType httpMethod: HttpMethod) {
        self.baseURL = baseURL
        self.httpMethod = httpMethod
    }
    
    internal static var `default`: AppConfiguration = {
        return AppConfiguration(baseURL: .rootAPI, HTTPMethodType: .get)
    }()
}

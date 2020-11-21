//
//  User+Resource.swift
//  ShaadiLib
//
//  Created by Nelson Thomas Pereira on 20/11/20.
//

import Foundation

extension User {
    private enum EndPoints: String {
        case root = "users"
    }
    
    @discardableResult
    public static func fetch(completionHandler: @escaping ([Self]) -> Void, failure: @escaping (ErrorConfig) -> Void) -> URLSessionDataTask {
        let resource = Resource<[Self]>(forURL: EndPoints.root.rawValue, decoder: JSONDecoder())
        let request = Service<[Self]>(resource: resource) { (result: ServiceResult<[Self]>) in
            if let value = result.value {
                completionHandler(value)
            } else {
                failure(ErrorConfig(statusCode: result.statusCode, error: result.error))
            }
        }
        
        return request.dataTask
    }
}

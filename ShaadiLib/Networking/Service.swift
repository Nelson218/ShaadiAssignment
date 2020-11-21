//
//  Service.swift
//  ShaadiLib
//
//  Created by Nelson Thomas Pereira on 20/11/20.
//

import Foundation

typealias JSONDictionary = [String: Any]

public enum CommonError: Error {
    case decodeFailedFor(url: URL?)
    case unknownError(errorString: String)
}

public struct ServiceResult<T> {
    public private(set) var value: T?
    public private(set) var error: Error?
    public private(set) var statusCode: HTTPStatusCode
    
    public init(value: T? = nil, Error error: Error? = nil, HTTPStatusCode statusCode: HTTPStatusCode) {
        self.value = value
        self.error = error
        self.statusCode = statusCode
    }
}

public final class Service<T> {
    
    public private(set) var dataTask: URLSessionDataTask
    
    public init(resource: Resource<T>, completionHandler: @escaping (ServiceResult<T>) -> Void) {
        self.dataTask = URLSession.shared.dataTask(with: resource.urlRequest) { (data, response, error) in

            let validStatusCode = (response as? HTTPURLResponse)?.statusCode ?? (error?._code ?? HTTPStatusCode.unreachable.rawValue)

            let statusCode = HTTPStatusCode(value: validStatusCode)
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(ServiceResult(value: nil, Error: error, HTTPStatusCode: statusCode))
                }
            }
            if let data = data {
                if let expectedType = resource.parse?(data) {
                    let result = ServiceResult(value: expectedType, Error: nil, HTTPStatusCode: statusCode)
                    DispatchQueue.main.async {
                        completionHandler(result)
                    }
                } else {
                    DispatchQueue.main.async {
                        completionHandler(ServiceResult(value: nil, Error: CommonError.decodeFailedFor(url: resource.urlRequest.url), HTTPStatusCode: statusCode))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(ServiceResult(value: nil, Error: CommonError.unknownError(errorString: "No data found"), HTTPStatusCode: statusCode))
                }
            }
        }

        dataTask.resume()
    }
}

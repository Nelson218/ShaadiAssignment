//
//  Resource.swift
//  ShaadiLib
//
//  Created by Nelson Thomas Pereira on 20/11/20.
//

import Foundation

public struct Resource<ExpectedType> {
    internal var urlRequest: URLRequest
    internal var parse: ((Data) -> ExpectedType?)?
}

extension Resource {
    internal init(forURL: String, additionalQueryItems: URLQueryItem? = nil, Configuration appConfiguration: AppConfiguration = .default) {
        
        //check if forURL has prefix /
        var forURL = forURL
        if !forURL.hasPrefix(#"/"#) {
            forURL = #"/"# + forURL
        }
        
        let urlString = appConfiguration.baseURL.rawValue + "\(forURL)"
        guard let url = URL(string: urlString) else  {
            fatalError("Error while constructing url \(urlString)")
        }
        
        self.urlRequest = URLRequest(url: url)
        self.urlRequest.httpMethod = appConfiguration.httpMethod.rawValue
        self.parse = { (data) in
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? ExpectedType {
                return json
            }
                              
            if let string = String(data: data, encoding: .utf8) {
                if ExpectedType.self == Int.self, let integer = Int(string) as? ExpectedType {
                    return integer
                }
                if ExpectedType.self == Float.self, let integer = Float(string) as? ExpectedType {
                    return integer
                }
                if let _string = string as? ExpectedType {
                    return _string
                }
            }
            return nil
        }
        
    }
}

extension Resource where ExpectedType: Decodable {
    internal init(forURL: String, additionalQueryItems: URLQueryItem? = nil, Configuration appConfiguration: AppConfiguration = .default, decoder: JSONDecoder) {
        self.init(forURL: forURL, additionalQueryItems: additionalQueryItems, Configuration: appConfiguration)
        parse = { (data) in
            do {
                return try decoder.decode(ExpectedType.self, from: data)
            } catch {
                print(error)
                return nil
            }
        }
    }
}

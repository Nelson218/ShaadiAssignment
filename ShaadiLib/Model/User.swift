//
//  User.swift
//  ShaadiLib
//
//  Created by Nelson Thomas Pereira on 20/11/20.
//

import Foundation

public struct User: Codable {
    public var id: Int
    public var name: String
    public var username: String
    public var email: String
    public var phone: String
    public var website: String
    public var company: Company
    public var address: Address
}

public struct Company: Codable {
    public var name: String
}

public struct Address: Codable {
    public var street: String?
    public var suite: String?
    public var city: String?
    public var zipcode: String?
}

extension User {
    public static var `default`: User {
        User()
    }
    
    private init() {
        id = 1
        name = "Nelson Pereira"
        username = "Nel"
        email = "Nelson218@gmail.com"
        phone = "12345"
        website = "shaddi.com"
        company = Company(name: "Digitas")
        address = Address(street: "Nallasopara", suite: "Building 404", city: "Mumbai", zipcode: "401203")
    }
}

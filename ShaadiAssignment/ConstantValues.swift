//
//  ConstantValues.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import Foundation

public enum ConstantValue {
    case name
    case userName
    case phone
    case webSite
    case company
    case address
    
    var description: String {
        switch self {
        case .name: return "Name: "
        case .userName: return "UserName: "
        case .phone: return "Call on: "
        case .webSite: return "Visit us on: "
        case .company: return "Company Name: "
        case .address: return "Address: "
        }
    }
}

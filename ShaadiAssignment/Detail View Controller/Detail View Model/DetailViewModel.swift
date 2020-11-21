//
//  DetailViewModel.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import UIKit
import ShaadiLib

extension User {
    func createViewModel() -> [ShaadiViewProtocol] {
        [DetailViewModel(title: "Name: ", detail: name),
         DetailViewModel(title: "UserName: ", detail: username),
         DetailViewModel(title: "Call on: ", detail: phone),
         DetailViewModel(title: "Visit us on: ", detail: website),
         DetailViewModel(title: "Company Name: ", detail: company.name),
         DetailViewModel(title: "Address: ", detail: fullAddress),
         StarViewModel(user: self)
        ]
    }
    
    private var fullAddress: String {
        [address.city, address.street, address.suite, address.zipcode].compactMap { $0 }.joined(separator: ", ")
    }
}

public struct DetailViewModel: ShaadiViewProtocol {
    internal private(set) var title: String
    internal private(set) var detail: String?
    
    public var nibName: String {
        return "DetailTableViewCell"
    }
    
    public var identifer: String {
        return "detailTableCellidentifier"
    }
}

public struct StarViewModel:ShaadiViewProtocol, ViewModelProtocol {
    
    public private(set) var user: User
    internal var onButtonClick: (() -> UIImage?)?
    
    init(user: User) {
        self.user = user
        onButtonClick = onSelect
    }

    public var nibName: String {
        return "StarTableViewCell"
    }
    
    public var identifer: String {
        return "starTableCellidentifier"
    }
}

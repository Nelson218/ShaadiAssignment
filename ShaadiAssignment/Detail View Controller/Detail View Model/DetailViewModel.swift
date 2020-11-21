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
        [DetailViewModel(constant: .name, detail: name),
         DetailViewModel(constant: .userName, detail: username),
         DetailViewModel(constant: .phone, detail: phone),
         DetailViewModel(constant: .webSite, detail: website),
         DetailViewModel(constant: .company, detail: company.name),
         DetailViewModel(constant: .address, detail: fullAddress),
         StarViewModel(user: self)
        ]
    }
    
    private var fullAddress: String {
        [address.city, address.street, address.suite, address.zipcode].compactMap { $0 }.joined(separator: ", ")
    }
}

public struct DetailViewModel: ShaadiViewProtocol {
    public private(set) var title: String
    public private(set) var detail: String?
    
    public init(constant: ConstantValue, detail: String) {
        self.title = constant.description
        self.detail = detail
    }
    
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

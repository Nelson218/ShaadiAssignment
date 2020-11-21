//
//  ListViewModel.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import UIKit
import ShaadiLib

public struct ListViewModel: ViewModelProtocol {
    public private(set) var name: NSMutableAttributedString?
    public private(set) var phone: NSMutableAttributedString?
    public private(set) var website: NSMutableAttributedString?
    public private(set) var companyName: NSMutableAttributedString?
    public var onButtonClick: (() -> UIImage?)?
    public private(set) var user: User

    public init(user: User) {
        self.user = user
        self.name = getAttributedString(forConstant: .name, detail: user.name)
        self.phone = getAttributedString(forConstant: .phone, detail: user.phone)
        self.website = getAttributedString(forConstant: .webSite, detail: user.website)
        self.companyName = getAttributedString(forConstant: .company, detail: user.company.name)
        self.onButtonClick = onSelect
    }
    
    private func getAttributedString(forConstant constant: ConstantValue, detail: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: constant.description, attributes: [.font: UIFont.systemFont(ofSize: 10), .foregroundColor: UIColor.black])
        
        let detailAttributedString = NSAttributedString(string: detail, attributes: [.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.darkGray])
        
        attributedString.append(detailAttributedString)
        return attributedString
    }
}

extension ListViewModel: ShaadiViewProtocol {
    public var nibName: String {
        "ListTableViewCell"
    }
    
    public var identifer: String {
        "listTableCellidentifier"
    }
}

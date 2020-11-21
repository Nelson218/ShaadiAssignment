//
//  ListViewModel.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import UIKit
import ShaadiLib

public struct ListViewModel: ViewModelProtocol {
    internal private(set) var name: NSMutableAttributedString?
    internal private(set) var phone: NSMutableAttributedString?
    internal private(set) var website: NSMutableAttributedString?
    internal private(set) var companyName: NSMutableAttributedString?
    internal var onButtonClick: (() -> UIImage?)?
    public private(set) var user: User

    public init(user: User) {
        self.user = user
        self.name = getAttributedString(forTitle: "Name: ", detail: user.name)
        self.phone = getAttributedString(forTitle: "Call on: ", detail: user.phone)
        self.website = getAttributedString(forTitle: "Visit us on: ", detail: user.website)
        self.companyName = getAttributedString(forTitle: "Company Name: ", detail: user.company.name)
        self.onButtonClick = onSelect
    }
    
    private func getAttributedString(forTitle title: String, detail: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: title, attributes: [.font: UIFont.systemFont(ofSize: 10), .foregroundColor: UIColor.black])
        
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

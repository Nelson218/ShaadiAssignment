//
//  ShaadiTableViewProtocol.swift
//  ShaadiLib
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import UIKit

public protocol ShaadiViewProtocol {
    var nibName: String { get }
    var identifer: String { get }
}

public protocol ShaadiTableViewCellProtocol {
    func prepare(shaadiViewModel: ShaadiViewProtocol)
}

public protocol ViewModelProtocol {
    var user: User { get }
}

extension ViewModelProtocol {
    private var userDefaultKey: String {
        "userID\(user.id)"
    }
    
    private var isSelected: Bool {
        UserDefaults.standard.bool(forKey: userDefaultKey)
    }
    
    private var starImageName: String {
        isSelected ? "markedStar" : "notMarkedStar"
    }
    
    public func onSelect() -> UIImage? {
        UserDefaults.standard.set(!isSelected, forKey: userDefaultKey)
        return starImage
    }
    
    public var starImage: UIImage? {
        UIImage(named: starImageName)
    }
}


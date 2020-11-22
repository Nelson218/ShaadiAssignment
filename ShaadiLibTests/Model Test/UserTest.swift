//
//  UserTest.swift
//  ShaadiLibTests
//
//  Created by Nelson Thomas Pereira on 22/11/20.
//

import Foundation
import ShaadiLib
import XCTest

class UserTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    func testListViewModel() {
        
        let user = User.default
        XCTAssertEqual(user.name, "Nelson Pereira")
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.username, "Nel")
        XCTAssertEqual(user.email, "Nelson218@gmail.com")
        XCTAssertEqual(user.phone, "12345")
        XCTAssertEqual(user.website, "shaddi.com")
        XCTAssertEqual(user.company.name, "Digitas")
        XCTAssertEqual(user.address.city, "Mumbai")
        XCTAssertEqual(user.address.street, "Nallasopara")
        XCTAssertEqual(user.address.suite, "Building 404")
        XCTAssertEqual(user.address.zipcode, "401203")
    }
}

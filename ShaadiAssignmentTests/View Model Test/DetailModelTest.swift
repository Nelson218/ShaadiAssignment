//
//  DetailModelTest.swift
//  ShaadiAssignmentTests
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import Foundation
import ShaadiAssignment
import ShaadiLib
import XCTest

class DetailModelTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    func testDetailViewModel() {
        
        let viewModel = DetailViewModel(constant: .userName, detail: "Nelson")
        XCTAssertEqual(viewModel.title, "UserName: ")
        XCTAssertEqual(viewModel.detail, "Nelson")
    }
}

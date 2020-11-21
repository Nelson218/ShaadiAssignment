//
//  ListViewModelTest.swift
//  ShaadiAssignmentTests
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import Foundation
import ShaadiAssignment
import ShaadiLib
import XCTest

class ListViewModelTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    func testListViewModel() {
        
        let viewModel = ListViewModel(user: .default)
        XCTAssertEqual(viewModel.name?.string, "Name: Nelson Pereira")
        XCTAssertEqual(viewModel.companyName?.string, "Company Name: Digitas")
        XCTAssertEqual(viewModel.phone?.string, "Call on: 12345")
        XCTAssertEqual(viewModel.website?.string, "Visit us on: shaddi.com")
    }
}

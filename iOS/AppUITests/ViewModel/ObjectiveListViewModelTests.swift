//
//  ObjectiveListViewModel.swift
//  AppUITests
//
//  Created by Toki on 31/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import XCTest
@testable import Warren

class ObjectiveListViewModelTests: XCTestCase {
    
    var viewModel: ObjectiveListViewModel!
    var mockApiService: MockObjectiveService!
    
    
    override func setUp() {
        super.setUp()
        mockApiService = MockObjectiveService()
        viewModel = ObjectiveListViewModel()
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.mockApiService = nil
        super.tearDown()
    }
    
    func testFetchObjectives() {
        
        mockApiService.portfolio = [Portfolio(id: "", name: "", background: Background(thumb: "", small: "", full: "", regular: "", raw: ""), totalBalance: 12.2, goalAmount: 100, goalDate: "")]
        viewModel.getAllAccounts()
        XCTAssertEqual(viewModel.objectives.count, 1)
        
    }
    
    
    func testFetchNoObjectives () {
        
        mockApiService.portfolio = nil
        viewModel.getAllAccounts()
        XCTAssertEqual(viewModel.objectives.count, 0)
        
    }
    
    
}


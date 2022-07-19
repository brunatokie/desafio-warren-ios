//
//  MockService.swift
//  AppUITests
//
//  Created by Toki on 31/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import XCTest
@testable import Warren

class LoginViewModelTests: XCTestCase {

    var viewModel: LoginViewModel!
    var mockApiService: MockLoginService!
    var isCalled = true
    
    override func setUp() {
        super.setUp()
        mockApiService = MockLoginService()
        viewModel = .init(apiService: mockApiService)
    }

    override func tearDown() {
        self.viewModel = nil
        self.mockApiService = nil
        super.tearDown()
    }
    
    
    func testLogin() {
        mockApiService.loginResult = .success(LoginResponse(accessToken: "", refreshToken: ""))
        viewModel.login { isCalled in
            isCalled
        }
        XCTAssertTrue(viewModel.isAuthenticated)
    }
    
    func testLoginWithError() {
        mockApiService.loginResult = .failure(NSError(domain: "", code: 1, userInfo: nil) as! NetworkError)
        viewModel.login { isCalled in
            isCalled
        }
        XCTAssertEqual(viewModel.isAuthenticated, false)
    }
}




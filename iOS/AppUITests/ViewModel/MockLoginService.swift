//
//  MockAPIService.swift
//  AppUITests
//
//  Created by Toki on 31/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation
@testable import Warren

final class MockLoginService: LoginServiceProtocol {
    var mockData: LoginResponse?

    var loginResult: Result<LoginResponse, NetworkError> = .success(LoginResponse(accessToken: "", refreshToken: ""))
    func loginRequest(email: String, password: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
        
       completion(loginResult)
    }
}

//
//  LoginViewModel.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation
import KeychainAccess

class LoginViewModel: ObservableObject {
   
    var email: String = ""
    var password: String = ""
    var acessTokenRef: Data?
    var refreshTokenRef: Data?
   
    @Published var error: Authentication.AuthenticationError?
    @Published var showProgressView = false
    @Published var isAuthenticated: Bool = false
    
    var loginDisabled: Bool {
        email.isEmpty || password.isEmpty
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        self.showProgressView = true
        let keychain = Keychain(service: "login")
        
        APIService().loginRequest(email: email, password: password) { result in
            
            switch result {
            case .success(let response):
        
                do {
                   
                    if let token = response.accessToken, let refreshToken = response.refreshToken {
                    try keychain.set(token, key: "acessToken")
                    self.acessTokenRef = keychain[attributes: "acessToken"]?.persistentRef
                    try keychain.set(String(refreshToken), key: "refreshToken")
                    self.refreshTokenRef = keychain[attributes: "refreshToken"]?.persistentRef
                    }
                    DispatchQueue.main.async {
                        self.showProgressView = false
                        
                        completion(true)
                        }
                }
                catch let error {
                    print(error)
                }
               
            case .failure(let error):
                
                DispatchQueue.main.async {
                    
                    self.error = error
                    self.showProgressView = false
                    completion(false)
                }
               
            }
        }
    }
    
}

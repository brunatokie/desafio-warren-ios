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
    
    @Published var alertItem: AlertItem?
    @Published var showProgressView = false
    @Published var isAuthenticated = false
    
    func login(completion: @escaping (Bool) -> Void) {
        self.showProgressView = true
        
        APIService().loginRequest(email: email, password: password) { result in
            DispatchQueue.main.async {
                self.showProgressView = false
                switch result {
                case .success(let response):
                    do {
                        if let token = response.accessToken, let refreshToken = response.refreshToken {
                            
                            //How to save token in keychain
                            let accessToken = token
                            let data = Data(accessToken.utf8)
                            KeychainHelper.standard.save(data, service: "access-token", account: "desafioWarren")
                            
                            self.showProgressView = false
                            self.isAuthenticated = true
                            completion(true)
                        }
                    }
                    catch let error {
                    }
                    
                case .failure(let error):
                    completion(false)
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidCredentials:
                        self.alertItem = AlertContext.invalidCredentials
                        
                    case .invalidResponse:
                        ""
                    }
                    
                }
            }
        }
    }
    
}

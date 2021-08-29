//
//  LoginViewModel.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
   
    var email: String = ""
    var password: String = ""
   
    @Published var error: Authentication.AuthenticationError?
    @Published var showProgressView = false
    @Published var isAuthenticated: Bool = false
    
    var loginDisabled: Bool {
        email.isEmpty || password.isEmpty
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        self.showProgressView = true
       
        APIService().loginRequest(email: email, password: password) { result in
            
            switch result {
            case .success(let response):
        
                do {
                   
                    if let response = response.accessToken {
                        //add access Token and Refresh Token in keychain
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
                    self.showProgressView = false
                    self.error = error
                    completion(false)
                }
               
            }
        }
    }
    
}

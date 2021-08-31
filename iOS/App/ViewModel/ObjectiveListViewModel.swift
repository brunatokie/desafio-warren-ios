//
//  ObjectiveListViewModel.swift
//  App
//
//  Created by Toki on 29/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation
import KeychainAccess

class ObjectiveListViewModel: ObservableObject {
    
    @Published var objectives: [Portfolio] = []
    @Published var showProgressView = false
    @Published var alertItem: AlertItem?
    
    func getAllAccounts() {
        self.showProgressView = true
        
        
        APIService().getAllObjectives {[self] (result) in
            DispatchQueue.main.async {
                self.showProgressView = false
            switch result {
            case .success(let result):
                    self.objectives = result

            case .failure(let error):
               
                switch error {
                case .invalidData:
                    self.alertItem = AlertContext.invalidData
                    
                case .invalidURL:
                    self.alertItem = AlertContext.invalidURL
                    
                case .invalidCredentials:
                   ""
                    
                case .invalidResponse:
                    self.alertItem = AlertContext.invalidResponse
                }
                
            }
        }
    }
}
}




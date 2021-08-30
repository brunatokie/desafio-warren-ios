//
//  Authentication.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        case invalidData
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("E-mail e senha estão incorretos", comment: "")
            case .invalidData:
                return NSLocalizedString("Sem Dados", comment: "")
                
            }
        }
    }
    
    
    func updateValidation(success: Bool) {
        withAnimation {
            DispatchQueue.main.async {
                self.isValidated = success
            }
            
        }
    }
}

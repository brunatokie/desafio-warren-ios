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
    
    
    func updateValidation(success: Bool) {
        withAnimation {
            DispatchQueue.main.async {
                self.isValidated = success
            }
            
        }
    }
}

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
    
    @Published var objectives: [ObjectiveViewModel] = []
    
    func getAllAccounts() {
        
        let keychain = Keychain()
        guard let token = keychain["acessToken"] else {
            return
        }
        
        APIService().getAllObjectives(token: token) { (result) in
            switch result {
            case .success(let objectives):
                DispatchQueue.main.async {
                    self.objectives = objectives.map(ObjectiveViewModel.init)
                }
                print(objectives)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct ObjectiveViewModel {
    
    let objective: Portfolio
    
    let id = UUID()
    var title: String {
        return objective.name
    }
    
    var image: String {
        return objective.background.small
    }
    
    var balance: Double {
        return objective.totalBalance
    }
}

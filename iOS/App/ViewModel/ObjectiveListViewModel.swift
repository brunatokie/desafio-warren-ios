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
    @Published var showProgressView = false
    
    
    func getAllAccounts() {
        self.showProgressView = true
        let keychain = Keychain()
        if let token = keychain["acessToken"] {
            
        
        
        APIService().getAllObjectives(token: token) { (result) in
            switch result {
            case .success(let objectives):
                DispatchQueue.main.async {
                    self.objectives = objectives.map(ObjectiveViewModel.init)
                    self.showProgressView = false
                }
                print(objectives)
            case .failure(let error):
                print(error.localizedDescription)
                self.showProgressView = false
            }
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
    
    var imageSmall: String {
        return objective.background.small
    }
    
    var imageRegular: String {
        return objective.background.regular
    }
    
    var balance: String {
        let num = objective.totalBalance
        let numString = String(format: "%.2f", num)
        return numString
    }
    
    var goalAmount: String {
        let stNum = String(objective.goalAmount ?? 00)
        return stNum
    }
    
    var goalDate: String {
        return convertDateFormater(objective.goalDate)
    }
    
    var progress: String {
        let num = (100 * objective.totalBalance) / (objective.goalAmount?.doubleValue ?? 00)
        return String(num)
    }
}

func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return  dateFormatter.string(from: date!)

    }

extension Int {
    var doubleValue: Double {
        return Double(self)
    }
}



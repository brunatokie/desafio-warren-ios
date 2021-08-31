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
    @Published var alertItem: AlertItem?
    
    func getAllAccounts() {
        self.showProgressView = true
        
        
        APIService().getAllObjectives {[self] (result) in
            DispatchQueue.main.async {
                self.showProgressView = false
            switch result {
            case .success(let result):
                self.objectives = result.map(ObjectiveViewModel.init)

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

struct ObjectiveViewModel {
    
    let objective: Portfolio
    let id = UUID()
    
    var name: String {
        return objective.name
    }
    
    var background: Background {
        return objective.background
    }
    
    var formattedBalance: String {
        let numString = String(format: "%.2f", objective.totalBalance)
        return numString
    }
    
    var progress: String {
        let num = String(format: "%.1f", (100 * objective.totalBalance) / (objective.goalAmount?.doubleValue ?? 1))
        return num
    }
    var formattedGoalAmount: String {
        return String(objective.goalAmount ?? 00)
    }
    
    var formattedGoalDate: String {
        return convertDateFormater(objective.goalDate)
    }
}

func convertDateFormater(_ date: String) -> String
{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: date)
    dateFormatter.dateFormat = "dd/MM/yyyy"
    return  dateFormatter.string(from: date!)
    
}

extension Int {
    var doubleValue: Double {
        return Double(self)
    }
}


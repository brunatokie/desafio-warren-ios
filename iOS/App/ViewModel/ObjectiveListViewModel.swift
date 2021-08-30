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
}

func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return  dateFormatter.string(from: date!)

    }



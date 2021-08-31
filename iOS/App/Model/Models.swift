//
//  Models.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation

//Login Model
struct LoginResponse: Codable {
    let accessToken, refreshToken: String?
}

struct LoginBody: Codable {
    let email: String
    let password: String
}

//Objectives Model
struct PortfolioResponse: Decodable {
    let portfolios: [Portfolio]
}


struct Portfolio: Decodable, Identifiable {
    let id : String
    let name: String
    let background: Background
    let totalBalance: Double
    let goalAmount: Int?
    let goalDate: String
    
    
    var formattedBalance: String {
        let numString = String(format: "%.2f", totalBalance)
        return numString
    }
    
    var progress: String {
        let num = String(format: "%.1f", (100 * totalBalance) / (goalAmount?.doubleValue ?? 1))
        return num
    }
    var formattedGoalAmount: String {
        return String(goalAmount ?? 00)
    }
    
    var formattedGoalDate: String {
        return convertDateFormater(goalDate)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, background, totalBalance, goalAmount, goalDate
    }
    
}

struct Background: Codable {
    let thumb, small, full, regular: String
    let raw: String
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


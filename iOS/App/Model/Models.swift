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

//Objectives Model
struct Objectives: Codable {
    let portfolios: [Portfolio]
}


struct Portfolio: Codable {
    let id: String
    let name: String
    let background: Background
    let totalBalance: Double
    let goalAmount: Int?
    let goalDate: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, background, totalBalance, goalAmount, goalDate
    }
}

struct Background: Codable {
    let thumb, small, full, regular: String
    let raw: String
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginBody: Codable {
    let email: String
    let password: String
    
}


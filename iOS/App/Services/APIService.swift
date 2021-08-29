//
//  APIService.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation

class APIService {

    func loginRequest(email: String, password: String, completion: @escaping (Result<LoginResponse, Authentication.AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "https://enigmatic-bayou-48219.herokuapp.com/api/v2/account/login") else {
            
            return
            
        }
        let body = LoginBody(email: email, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.accessToken, let refresh = loginResponse.refreshToken else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(loginResponse))
        }.resume()
    }
    
    func getAllObjectives(token: String, completion: @escaping (Result<[Portfolio], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://enigmatic-bayou-48219.herokuapp.com/api/v2/portfolios/mine") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "acess-token")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let accounts = try? JSONDecoder().decode([Portfolio].self, from: data) else {
                completion(.failure(.decodingError))
                return
            }
            
            completion(.success(accounts))
            print(accounts)
        }.resume()
    }
}

//
//  APIService.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation
import Combine

class APIService {

    func loginRequest(email: String, password: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://enigmatic-bayou-48219.herokuapp.com/api/v2/account/login") else {
            completion(.failure(.invalidURL))
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
    
    func getAllObjectives(completion: @escaping (Result<[Portfolio], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://enigmatic-bayou-48219.herokuapp.com/api/v2/portfolios/mine" ) else {
            completion(.failure(.invalidURL))
            return
        }
        
        //Read data from keychain
        let readData = KeychainHelper.standard.read(service: "access-token", account: "desafioWarren")!
        let readAccessToken = String(data: readData, encoding: .utf8)
        
        if let token = readAccessToken {
        var request = URLRequest(url: url)
            request.addValue("\(token)", forHTTPHeaderField: "access-token")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(PortfolioResponse.self, from: data)
                completion(.success(decodedResponse.portfolios))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
}
    }}


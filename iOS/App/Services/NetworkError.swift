//
//  NetworkError.swift
//  App
//
//  Created by Toki on 30/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI
import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidCredentials
}

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button?
}


enum AlertContext {
    
    //MARK: - Network Errors
    static let invalidURL = AlertItem(title: Text("Erro"),
                                      message: Text("Falha no servidor"),
                                      dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Erro"),
                                           message: Text("Falha no servidor"),
                                           dismissButton: .default(Text("Ok")))
    
    static let invalidData = AlertItem(title: Text("Erro"),
                                       message: Text("Falha no servidor"),
                                       dismissButton: .default(Text("Ok")))
    
    static let invalidCredentials = AlertItem(title: Text("Login Invalido"),
                                       message: Text("Verifique se Login e Senha estão corretos"),
                                       dismissButton: .default(Text("Ok")))
}

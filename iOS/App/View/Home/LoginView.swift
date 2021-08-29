//
//  LoginView.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    @Binding var showModal: Bool
    
    var body: some View {
        
        VStack {
            
            Form {
                
                TextField("Username", text: $loginVM.email)
                HStack {
                    SecureField("Password", text: $loginVM.password)
                    if loginVM.showProgressView {
                        ProgressView()
                    }
                    Button(action: {

                        
                    }) {
                        Image("right")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .leading)
                    }
                }
                
            }.buttonStyle(PlainButtonStyle())
            .background(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
           
        }
        
        
        .background(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.error) { error in
            Alert(title: Text("Login Inválido"), message: Text(error.localizedDescription))
        }
    }
}


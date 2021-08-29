//
//  SwiftUIView.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

struct LoginForm: View {
    
    
    @StateObject private var loginVM = LoginViewModel()
    @Binding var showModal: Bool
    @EnvironmentObject var authentication: Authentication
    
    init(showModal: Binding<Bool>){
        self._showModal = showModal
            UITableView.appearance().backgroundColor = .clear
        }

    var body: some View {
        VStack{
        Form {
            
            TextField("Username", text: $loginVM.email)
            HStack {
                SecureField("Password", text: $loginVM.password)
                if loginVM.showProgressView {
                    ProgressView()
                }
                Button(action: {
                    loginVM.login { success in
                        authentication.updateValidation(success: success)
                        self.showModal = false
                    }
                    
                }) {
                    Image("right")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .leading)
                }
            }
            
        }.buttonStyle(PlainButtonStyle())
        
    }.background(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.error) { error in
            Alert(title: Text("Login Inválido"), message: Text(error.localizedDescription))
        }
    }
}


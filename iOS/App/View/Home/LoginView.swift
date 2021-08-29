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
    @Binding var showModal: Bool
    
    var body: some View {
        GeometryReader { view in
            
            VStack (spacing: .none){
                
                LoginForm(showModal: _showModal)
                
                
                Button("Esqueci a senha") {
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .padding(.bottom, view.size.height * 0.45)
                .padding(.leading,25)
            }
            .padding(.top, view.size.height * 0.3)
            
            .background(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)).edgesIgnoringSafeArea(.all))
            .disabled(loginVM.showProgressView)
            .alert(item: $loginVM.error) { error in
                Alert(title: Text("Login Inválido"), message: Text(error.localizedDescription))
                
            }
        }
    }
}


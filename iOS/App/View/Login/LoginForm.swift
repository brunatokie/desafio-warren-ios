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
    @StateObject private var objectiveVM = ObjectiveListViewModel()
    @Binding var showModal: Bool
    @EnvironmentObject var authentication: Authentication
    
    init(showModal: Binding<Bool>){
        self._showModal = showModal
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        VStack (spacing: .zero){
            Form {
                TextField("Username", text: $loginVM.email)
                HStack {
                    SecureField("Password", text: $loginVM.password)
                    if loginVM.showProgressView {
                        ProgressView()
                    }
                    Button(action: {
                        showModal = false
                        loginVM.login { success in
                            authentication.updateValidation(success: success)
                            
                            
                        }
                    }) {
                        Image("right")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .leading)
                    }
                }
            }
            Button("Esqueci a senha") {
            }
            .foregroundColor(.white)
            .padding(.leading,25)
            .foregroundColor(.white)
        }.background(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}


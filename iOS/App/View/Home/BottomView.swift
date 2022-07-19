//
//  BottomView.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

struct BottomView: View {
    
    @State private var showModal = false
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        GeometryReader { view in
            VStack {
                Button(action: {
                    debugPrint("Abra sua conta")
                }) {
                    Text("ABRA SUA CONTA")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                }
                .frame(width: view.size.width * 0.90, height: 50)
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color(#colorLiteral(red: 0.8784313725, green: 0.168627451, blue: 0.3411764706, alpha: 1)), lineWidth: 10))
                .background(Color(#colorLiteral(red: 0.8784313725, green: 0.168627451, blue: 0.3411764706, alpha: 1)))
                .padding()
                
                Button(action: {
                    showModal = true
                    
                }){
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                }
                .frame(width: view.size.width * 0.90, height: 50)
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color(#colorLiteral(red: 0.4588235294, green: 0.462745098, blue: 0.5019607843, alpha: 1)), lineWidth: 10))
                .background(Color(#colorLiteral(red: 0.4588235294, green: 0.462745098, blue: 0.5019607843, alpha: 1)))
            }
            .sheet(isPresented: $showModal) {
                NavigationView {
                    VStack {
                        LoginView(showModal: self.$showModal)
                    }
                    .navigationBarTitle("Login", displayMode: .inline)
                    
                    .navigationBarItems(leading: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        self.showModal = false
                    }) {
                        Image("cancel")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .leading)
                            .foregroundColor(.white)
                    }
                    )
                    .navigationBarColor(backgroundColor: #colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1), tintColor: .white)
                }
            }
            .frame(width: view.size.width, height: view.size.height)
        }
        .padding(.bottom, 20)
        Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)).edgesIgnoringSafeArea(.all)
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView()
            .previewLayout(.fixed(width: 300, height: 300))
    }
}

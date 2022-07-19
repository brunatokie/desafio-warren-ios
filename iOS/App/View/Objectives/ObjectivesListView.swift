//
//  ObjectivesListView.swift
//  App
//
//  Created by Toki on 29/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI


struct ObjectivesListView: View {
    
    @EnvironmentObject var authentication: Authentication
    @StateObject private var objectiveVM = ObjectiveListViewModel()
    
    init(){
           let navigationBarAppearance = UINavigationBarAppearance()
           navigationBarAppearance.backgroundColor = UIColor(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1))
           UIScrollView.appearance().backgroundColor = UIColor(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1))
        
       }
    
    var body: some View {
        ZStack {
        NavigationView {
            GeometryReader { view in
               
                    List(objectiveVM.objectives, id: \.id) { obj in
                            NavigationLink(destination:
                                            ObjectiveDetailView(objetivos: obj)){
                                ObjectiveRow(objetivos: obj)
                                    .frame(width: view.size.width, height: 180)
                                    .listRowBackground(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
                            }
                        }
                        .listRowBackground(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
                    .navigationTitle("Meus Objetivos")
                        
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Sair") {
                                    authentication.updateValidation(success: false)
                                }
                            }
                        }
                }
            .edgesIgnoringSafeArea(.all)
        }.navigationViewStyle(StackNavigationViewStyle())
        
        .onAppear { objectiveVM.getAllAccounts()}
        if objectiveVM.showProgressView { ProgressView() }
       
        } .alert(item: $objectiveVM.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
    }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectivesListView()
    }
}

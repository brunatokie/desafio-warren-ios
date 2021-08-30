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
    @StateObject private var objectiveListVM = ObjectiveListViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = .clear
                UITableViewCell.appearance().backgroundColor = .clear
          
          
    }
    
    var body: some View {
        
        NavigationView {
            GeometryReader { view in
                VStack{
                    ObjectiveHeaderView()
                        .frame(width: view.size.width, height: 200, alignment: .top)
                    List(objetivos) { obj in
                        NavigationLink(destination:
                                        ObjectiveDetailView(objetivos: obj)){
                            ObjectiveRow(objetivos: obj)
                                .frame(width: view.size.width, height: 180)
                                .listRowBackground(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
                           
                        }
                    }
                    .listRowBackground(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
                    
                    .navigationTitle("")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Sair") {
                                authentication.updateValidation(success: false)
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectivesListView()
    }
}

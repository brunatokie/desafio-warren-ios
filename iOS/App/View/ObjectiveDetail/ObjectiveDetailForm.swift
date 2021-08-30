//
//  ObjectiveDetailForm.swift
//  App
//
//  Created by Toki on 29/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

struct ObjectiveDetailForm: View {
    
    var objetivos: ObjectiveViewModel
    var body: some View {
        GeometryReader { view in
            Form {
                Section(header: Text("Objetivo")) {
                    HStack {
                        Text("Progresso")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text(objetivos.progress)
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }
                    HStack {
                        Text("Meta final")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text(objetivos.goalAmount)
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }
                    HStack {
                        Text("Data final")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text(objetivos.goalDate)
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }                    
                }
                .listRowBackground(Color(#colorLiteral(red: 0.4588235294, green: 0.462745098, blue: 0.5019607843, alpha: 1)))
                
            }
            .frame(width: view.size.width, height: 400)
            .padding(.top, 20)
        }
    }
}

//
//  ObjectiveDetailForm.swift
//  App
//
//  Created by Toki on 29/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

struct ObjectiveDetailForm: View {
    var body: some View {
        GeometryReader { view in
            Form {
                Section(header: Text("Objetivo")) {
                    HStack {
                        Text("Progresso")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text("0,00")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }
                    HStack {
                        Text("Meta final")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text("0,00")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }
                    HStack {
                        Text("Data final")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text("0,00")
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
struct ObjectiveDetailForm_Previews: PreviewProvider {
    static var previews: some View {
        ObjectiveDetailForm()
    }
}

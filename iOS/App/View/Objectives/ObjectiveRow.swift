//
//  Objective.swift
//  App
//
//  Created by Toki on 29/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI
import URLImage

struct ObjectiveRow: View {
    
    
    var objetivos: Portfolio
    @StateObject private var objectiveListVM = ObjectiveListViewModel()
    
    var body: some View {
        GeometryReader { view in
            ZStack(alignment: .top){
                
                if let url = URL(string: objetivos.background.small ){
                    URLImage(url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: view.size.width - 40,  height: view.size.height)
                            .clipped()
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)), lineWidth: 4))
                            .shadow(radius: 10)
                            
                    }
                }
                
                VStack {
                    Text(objetivos.name)
                        .font(.system(size: 20, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    Text(String(objetivos.totalBalance))
                        .font(.system(size: 20, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .frame(alignment: .center)
                .padding(.leading, 20)
            }
            .frame(width: view.size.width - 40, height: 170)
           
        }
    }
}


struct Objective_Previews: PreviewProvider {
    static var previews: some View {
        ObjectiveRow(objetivos: objetivos[0])
            .previewLayout(.fixed(width: 600, height: 500))
    }
}

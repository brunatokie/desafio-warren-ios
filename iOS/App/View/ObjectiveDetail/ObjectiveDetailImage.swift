//
//  DetailImage.swift
//  App
//
//  Created by Toki on 30/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI
import URLImage

struct ObjectiveDetailImage: View {
    var objetivos: Portfolio
    
    var body: some View {
        GeometryReader { view in
         
        ZStack (alignment: .top) {
            if let url = URL(string: objetivos.background.regular ){
                URLImage(url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: view.size.width - 40,  height: 370)
                        .clipped()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                }
            }
            VStack{
                Text(objetivos.name)
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    .foregroundColor(Color(#colorLiteral(red: 0.9764705882, green: 0.568627451, blue: 0.007843137255, alpha: 1)))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    .padding(.leading, 30)
            }
            
        }
        .background(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
        .frame(width: view.size.width, height: view.size.height)
    
        }
    }
}

struct DetailImage_Previews: PreviewProvider {
    var objetivos: Portfolio
    static var previews: some View {
       
        ObjectiveDetailImage(objetivos: Portfolio(id: "", name: "Nome", background: Background(thumb: "", small: "", full: "", regular: "", raw: ""), totalBalance: 0.0, goalAmount: 1, goalDate: ""))
    }
}

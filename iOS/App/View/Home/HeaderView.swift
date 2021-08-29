//
//  HeaderView.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        
    GeometryReader { view in
        VStack{
        ZStack(alignment: .top) {
            Image("homegirl")
                .resizable()
                .aspectRatio(contentMode: .fill)
                
            VStack(alignment: .leading) {
            Image("logo")
                .frame(alignment: .leading)
                .padding(.top, 50)
                .clipped()
            Text("Investir")
                .font(.subheadline)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            Text("#des\ncom\nplicou")
                .font(.system(size: 30, weight: .heavy, design: .default))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            .frame(alignment: .top)
            .padding(.leading, 20)
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        }
    }
}
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.fixed(width: 300, height: 450))
    }
}

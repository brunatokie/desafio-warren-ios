//
//  HomeLoginView.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

struct HomeLoginView: View {
    var body: some View {
        NavigationView{
            GeometryReader { view in
                VStack {
                    HeaderView()
                        .frame(width: view.size.width, height: view.size.height * 0.7)
                    BottomView()
                        .frame(width: view.size.width, height: view.size.height * 0.3)
                }
                .background(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
                
            }
        }.background(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)).edgesIgnoringSafeArea(.all))
    }
}

struct HomeLoginView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLoginView()
    }
}

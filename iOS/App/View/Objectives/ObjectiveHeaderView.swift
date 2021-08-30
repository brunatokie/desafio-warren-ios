//
//  ObjectiveHeaderView.swift
//  App
//
//  Created by Toki on 29/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

struct ObjectiveHeaderView: View {
    
    var body: some View {
        GeometryReader { view in
        VStack {
            Text("Meus objetivos")
                .foregroundColor(Color.white)
                .padding(.top, 120)
                .padding(.leading, 20)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 30, weight: .heavy, design: .default))
        }
        .frame(width: view.size.width, height: 200, alignment: .top)
        .background(Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)))
    }
}
}

struct ObjectiveHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectiveHeaderView()
    }
}

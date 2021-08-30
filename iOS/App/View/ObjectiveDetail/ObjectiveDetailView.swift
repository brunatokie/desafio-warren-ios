//
//  ObjectiveDetailView.swift
//  App
//
//  Created by Toki on 29/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI
import URLImage

struct ObjectiveDetailView: View {
    var objetivos: ObjectiveViewModel
    
    init(objetivos : ObjectiveViewModel){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1))
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.objetivos = objetivos
    }
    
    var body: some View {
        
        GeometryReader { view in
            ScrollView (.vertical, showsIndicators: false) {
                Color(#colorLiteral(red: 0.2274509804, green: 0.2235294118, blue: 0.2509803922, alpha: 1)).edgesIgnoringSafeArea(.all)
                VStack{
                    ObjectiveDetailImage(objetivos: objetivos)
                        .frame(width: view.size.width, height: 300, alignment: .top)
                    Spacer()
                    ObjectiveDetailForm(objetivos: objetivos)
                    
                }
            }
        }
    }
}




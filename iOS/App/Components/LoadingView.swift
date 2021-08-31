//
//  LoadingView.swift
//  App
//
//  Created by Toki on 31/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(2)
        }
    }
}

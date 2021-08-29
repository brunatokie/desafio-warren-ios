//
//  DesafioWarrenApp.swift
//  App
//
//  Created by Toki on 28/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import SwiftUI

@main
struct SwiftuiTestApp: App {
    @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                ObjectiveListView()
                    .environmentObject(authentication)
            } else {
                HomeLoginView()
                    .environmentObject(authentication)
            }
            
        }
    }
}

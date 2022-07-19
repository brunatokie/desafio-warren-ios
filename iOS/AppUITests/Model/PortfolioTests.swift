//
//  Portfolio.swift
//  AppUITests
//
//  Created by Toki on 31/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation
import XCTest
@testable import Warren

class PortfolioTests: XCTestCase {
    
    func testSuccessParcer() {
        let json = """
        {
        "_id": "5d9e29c7b6c3123b9f5f3268",
              "name": "Disney!",
              "background": {
                "thumb": "https://images.unsplash.com/photo-1463109598173-3864231fade5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjg3NTU5fQ",
                "small": "https://images.unsplash.com/photo-1463109598173-3864231fade5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjg3NTU5fQ",
                "full": "https://images.unsplash.com/photo-1463109598173-3864231fade5?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjg3NTU5fQ",
                "regular": "https://images.unsplash.com/photo-1463109598173-3864231fade5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjg3NTU5fQ",
                "raw": "https://images.unsplash.com/photo-1463109598173-3864231fade5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjg3NTU5fQ"
              },
              "totalBalance": 522.2952415271,
              "goalAmount": 200000,
              "goalDate": "2029-10-09"
        }
        """.data(using: .utf8)!
        
        let portfolio = try! JSONDecoder().decode(Portfolio.self, from: json)
        
        XCTAssertNotNil(portfolio)
       
}
}

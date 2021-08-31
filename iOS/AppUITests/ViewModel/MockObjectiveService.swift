//
//  MockObjectiveService.swift
//  AppUITests
//
//  Created by Toki on 31/08/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation
@testable import Warren

final class MockObjectiveService: ObjectiveServiceProtocol {
       
        var portfolio: [Portfolio]?
        var error: NetworkError?
        
    func objectivesList(completion: @escaping (Result<[Portfolio], NetworkError>) -> Void) {
        
        if let portfolio = portfolio {
            completion(Result.success(portfolio))
        } else {
            completion(Result.failure(NetworkError.invalidCredentials))
        }
    }
}

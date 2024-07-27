//
//  MockWebService.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Sajed Shaikh on 27/07/24.
//

import Foundation

class MockWebService: NetworkService {
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        if username == "JohnDoe" && password == "Password" {
            completion(.success(()))
        } else {
            completion(.failure(.notAuthenticated))
        }
        
    }
}

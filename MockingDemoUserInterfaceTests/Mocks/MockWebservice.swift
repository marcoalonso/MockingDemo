//
//  MockWebservice.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Marco Alonso Rodriguez on 08/05/23.
//

import Foundation

class MockWebservice: NetworkService {
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        
        if username == "JohnDoe" && password == "Password" {
            completion(.success(()))
        } else {
            completion(.failure(.notAuthenticated))
        }
    }
    
    
}

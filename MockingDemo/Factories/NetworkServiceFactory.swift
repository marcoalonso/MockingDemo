//
//  NetworkServiceFactory.swift
//  MockingDemo
//
//  Created by Marco Alonso Rodriguez on 08/05/23.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> NetworkService {
        
        let environment = ProcessInfo.processInfo.environment["ENV"]
        
        if let environment = environment {
            if environment == "TEST" {
                return MockWebservice()
            } else {
                return Webservice()
            }
            
        } else {
            return Webservice()
        }
    }
    
}

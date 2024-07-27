//
//  NetworkServiceFactory.swift
//  MockingDemo
//
//  Created by Sajed Shaikh on 27/07/24.
//

import Foundation

class NetworkServiceFactory {
    static func create() -> NetworkService {
        let environment = ProcessInfo.processInfo.environment["ENV"]
        
        if let environment = environment {
            if environment == "TEST" {
                return MockWebService()
            } else {
                return Webservice()
            }
        } else {
            return Webservice()
        }
    }
}

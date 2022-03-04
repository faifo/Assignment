//
//  NetworkManager.swift
//  Assignment
//
//  Created by Solo on 04/03/2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    var requests: [NetworkService] = []
    
    func addRequest(_ request: NetworkService) {
        NetworkManager.shared.requests.append(request)
    }
    
    func removeRequest(_ request: NetworkService) {
        NetworkManager.shared.requests.removeAll(where: { request === $0 })
    }
}

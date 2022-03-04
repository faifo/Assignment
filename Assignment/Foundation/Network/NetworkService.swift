//
//  NetworkService.swift
//  Assignment
//
//  Created by Solo on 04/03/2022.
//

import Foundation

protocol Parserable {
    func parse<T: Decodable>(data: Data) -> T?
    func parseArray<T: Decodable>(data: Data) -> [T]?
}

class NetworkService {
    let url: URL
    let parser: Parserable
    var task: URLSessionDataTask?
    
    init(url: URL, parser: Parserable) {
        self.url = url
        self.parser = parser
    }
    
    @discardableResult
    func request<T: Decodable>(completion: @escaping (Result<T?, Error>) -> Void) -> URLSessionDataTask {
        NetworkManager.shared.addRequest(self)
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else {
                return
            }
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                let model: T? = self.parser.parse(data: data)
                completion(.success(model))
            }
            NetworkManager.shared.removeRequest(self)
        }
        task.resume()
        self.task = task
        return task
    }
    
    @discardableResult
    func requestArray<T: Decodable>(completion: @escaping (Result<[T]?, Error>) -> Void) -> URLSessionDataTask {
        NetworkManager.shared.addRequest(self)
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else {
                return
            }
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                let model: [T]? = self.parser.parseArray(data: data)
                completion(.success(model))
            }
            NetworkManager.shared.removeRequest(self)
        }
        task.resume()
        self.task = task
        return task
    }
}

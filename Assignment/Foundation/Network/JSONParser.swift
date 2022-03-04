//
//  JSONParser.swift
//  Assignment
//
//  Created by Solo on 04/03/2022.
//

import Foundation

class JSONParser: Parserable {
    func parse<T: Decodable>(data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        return try? jsonDecoder.decode(T.self, from: data)
    }
    
    func parseArray<T: Decodable>(data: Data) -> [T]? {
        let jsonDecoder = JSONDecoder()
        return try? jsonDecoder.decode([T].self, from: data)
    }
}

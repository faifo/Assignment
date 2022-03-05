//
//  SuffixNode.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import Foundation

class SuffixNode<T: Searchable> {
    var parentKey: String
    var models: [T]
    var node: [String: SuffixNode]
    
    init(parentKey: String, models: [T]) {
        self.parentKey = parentKey
        self.models = models
        var dict: [String: [Array<T>.Element]] = Dictionary(grouping: models) { model in
                // create key with parentKey + character in index (parentKey.count)
            if let nextChar = Array(model.searchText.lowercased())[safe: parentKey.count]?.lowercased() {
                return "\(parentKey)\(nextChar)"
            } else {
                    // create redundant node when it can't create key
                return ""
            }
        }
            // remove redundant node
        dict[""] = nil
        let tuple = dict.map({ key, value -> (String, SuffixNode) in
            let node = SuffixNode<T>(parentKey: key.lowercased(), models: value)
            return (key, node)
        })
        node = Dictionary(uniqueKeysWithValues: tuple)
    }
    
    func search(text: String) -> [T] {
            // case empty string
        if parentKey.isEmpty, text.isEmpty {
            return models
        }
            // get a random key to compare length
        guard let key = node.keys.first else {
            return []
        }
            // if key length equal to search text's length: get in dictionary
            // if key length bigger than search text's length: create new key with text prefix key length and get in dictionary
            // other cases: no results
        if text.count == key.count {
            return node[text]?.models ?? []
        } else if text.count > key.count {
            let newKey = String(text.prefix(key.count)).lowercased()
            return node[newKey]?.search(text: text) ?? []
        } else {
            return []
        }
    }
}

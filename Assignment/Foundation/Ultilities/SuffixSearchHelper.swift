//
//  SuffixSearchHelper.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import Foundation

protocol Searchable: Hashable {
    var searchText: String { get }
}

class SuffixSearchHelper<T: Searchable> {
    var nodes: SuffixNode<T>
    
    init(models: [T]) {
        nodes = SuffixNode<T>(parentKey: "", models: models)
    }
    
    func search(text: String) -> [T] {
        return nodes.search(text: text.lowercased())
    }
}

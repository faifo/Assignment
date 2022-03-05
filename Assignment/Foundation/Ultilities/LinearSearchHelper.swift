//
//  LinearSearchHelper.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import Foundation

class LinearSearchHelper<T: Searchable> {
    var models: [T]
    
    init(models: [T]) {
        self.models = models
    }
    
    func search(text: String) -> [T] {
        if text.isEmpty {
            return models
        } else {
            let lowercaseText = text.lowercased()
            return models.filter {
                $0.searchText.lowercased().hasPrefix(lowercaseText)
            }
        }
    }
}

//
//  Collection+Extensions.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

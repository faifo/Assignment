//
//  LocalFilesManager.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import Foundation

class Utils {
    static func readLocalFile(name: String, fileExtension: String) -> Data? {
        if let bundlePath = Bundle.main.path(forResource: name, ofType: fileExtension),
           let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
        return nil
    }
}

//
//  ScrollView+Extensions.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import UIKit

extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
}

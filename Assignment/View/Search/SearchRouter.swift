//
//  SearchRouter.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import Foundation

class SearchRouter {
    weak var viewController: SearchViewController!
    var dataSource: SearchViewControllerDataSource?
}

extension SearchRouter: SearchRouterProtocol {
    
}

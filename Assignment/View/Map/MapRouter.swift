//
//  MapRouter.swift
//  Assignment
//
//  Created by Solo on 06/03/2022.
//

import Foundation

class MapRouter {
    weak var viewController: MapViewController!
    var dataSource: MapViewControllerDataSource?
}

extension MapRouter: MapRouterProtocol {
    
}

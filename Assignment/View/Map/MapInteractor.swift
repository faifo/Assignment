//
//  MapInteractor.swift
//  Assignment
//
//  Created by Solo on 06/03/2022.
//

import Foundation

class MapInteractor: MapViewControllerDataSource {
    var output: MapInteractorOutputProtocol!
    var cityModel: CityModel?
}

extension MapInteractor: MapViewControllerOutputProtocol {
    
}

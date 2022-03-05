//
//  SearchInteractor.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import Foundation

class SearchInteractor: SearchViewControllerDataSource {
    var output: SearchInteractorOutputProtocol!
    var searchCityModels: [CityModel]?
}

extension SearchInteractor: SearchViewControllerOutputProtocol {
    func search(text: String) {
        output.searchSuccess()
    }
}

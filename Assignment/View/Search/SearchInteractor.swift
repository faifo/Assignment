//
//  SearchInteractor.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import Foundation

class SearchInteractor: SearchViewControllerDataSource {
    var output: SearchInteractorOutputProtocol!
    var searchHelper: SuffixSearchHelper<CityModel>?
    var searchCityModels: [CityModel]?
}

extension SearchInteractor: SearchViewControllerOutputProtocol {
    func search(text: String) {
        searchCityModels = searchHelper?.search(text: text)
        output.searchSuccess()
    }
}

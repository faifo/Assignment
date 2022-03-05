//
//  SearchPresentor.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import Foundation

class SearchPresenter {
    weak var output: SearchPresenterOutputProtocol!
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    func searchSuccess() {
        output.searchSuccess()
    }
}

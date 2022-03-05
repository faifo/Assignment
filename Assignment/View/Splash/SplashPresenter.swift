//
//  SplashPresenter.swift
//  Assignment
//
//  Created by Solo on 04/03/2022.
//

import Foundation

class SplashPresenter {
    weak var output: SplashPresenterOutputProtocol!
}

extension SplashPresenter: SplashInteractorOutputProtocol {
    func requestCityDataSuccess(response: [CityModel]) {
        let sortedCityModels = response.sorted(by: { $0.name < $1.name })
        let helper = SuffixSearchHelper(models: sortedCityModels)
        DispatchQueue.main.async {
            self.output.requestCityDataSuccess(helper: helper)
        }
    }
}

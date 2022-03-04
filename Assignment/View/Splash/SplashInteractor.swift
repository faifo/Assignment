//
//  SplashInteractor.swift
//  Assignment
//
//  Created by Solo on 04/03/2022.
//

import Foundation

class SplashInteractor: SplashViewControllerDataSource {
    var url: URL?
    var output: SplashInteractorOutputProtocol!
}

extension SplashInteractor: SplashViewControllerOutputProtocol {
    func requestCityData() {
        guard let url = url else {
            return
        }
        NetworkService(url: url, parser: JSONParser()).requestArray { [weak self] (result: Result<[CityModel]?, Error>) in
            switch result {
                case .success(let cityModels):
                    self?.output.requestCityDataSuccess(response: cityModels ?? [])
                case .failure(_):
                        //TODO: Handle fail request
                    break
            }
        }
    }
}

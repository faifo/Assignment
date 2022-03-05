//
//  SplashConfigurator.swift
//  Assignment
//
//  Created by Solo on 04/03/2022.
//

import Foundation

// MARK: Configuration
class SplashConfigurator {
    class func viewcontroller() -> SplashViewController {
        let viewController = SplashViewController()
        let presenter = SplashPresenter()
        presenter.output = viewController
        
        let interactor = SplashInteractor()
        interactor.output = presenter
        
        let router = SplashRouter()
        router.viewController = viewController
        router.dataSource = interactor
        
        viewController.output = interactor
        viewController.router = router
        
        return viewController
    }
}

// MARK: Data passing
protocol SplashViewControllerDataSource: AnyObject {
    var url: URL? { get set }
}

// MARK: View Interface
protocol SplashViewControllerOutputProtocol {
    func requestCityData()
}

// MARK: Interactor Interface
protocol SplashInteractorOutputProtocol {
    func requestCityDataSuccess(response: [CityModel])
}

// MARK: Presenter Interface
protocol SplashPresenterOutputProtocol: AnyObject {
    func requestCityDataSuccess(helper: SuffixSearchHelper<CityModel>)
}

// MARK: Router
protocol SplashRouterProtocol {
    func pushToSearch(helper: SuffixSearchHelper<CityModel>)
}

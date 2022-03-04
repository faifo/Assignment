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
        
        viewController.output = interactor
        viewController.router = router
        
        return viewController
    }
}

    // MARK: View Interface
protocol SplashViewControllerOutputProtocol {
}

    // MARK: Interactor Interface
protocol SplashInteractorOutputProtocol {
}

    // MARK: Presenter Interface
protocol SplashPresenterOutputProtocol: AnyObject {
}

    // MARK: Router
protocol SplashRouterProtocol {
}

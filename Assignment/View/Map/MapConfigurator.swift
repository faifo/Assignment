//
//  MapConfigurator.swift
//  Assignment
//
//  Created by Solo on 06/03/2022.
//

import Foundation

    // MARK: Configuration
class MapConfigurator {
    class func viewcontroller() -> MapViewController {
        let viewController = MapViewController()
        let presenter = MapPresenter()
        presenter.output = viewController
        
        let interactor = MapInteractor()
        interactor.output = presenter
        
        let router = MapRouter()
        router.viewController = viewController
        router.dataSource = interactor
        
        viewController.output = interactor
        viewController.router = router
        
        return viewController
    }
}

    // MARK: Data passing
protocol MapViewControllerDataSource: AnyObject {
    var cityModel: CityModel? { get set }
}

    // MARK: View Interface
protocol MapViewControllerOutputProtocol {
    
}

    // MARK: Interactor Interface
protocol MapInteractorOutputProtocol {
    
}

    // MARK: Presenter Interface
protocol MapPresenterOutputProtocol: AnyObject {
    
}

    // MARK: Router
protocol MapRouterProtocol {
    
}

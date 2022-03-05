//
//  SearchConfigurator.swift
//  Assignment
//
//  Created by Solo on 05/03/2022.
//

import Foundation

// MARK: Configuration
class SearchConfigurator {
    class func viewcontroller() -> SearchViewController {
        let viewController = SearchViewController()
        let presenter = SearchPresenter()
        presenter.output = viewController
        
        let interactor = SearchInteractor()
        interactor.output = presenter
        
        let router = SearchRouter()
        router.viewController = viewController
        router.dataSource = interactor
        
        viewController.output = interactor
        viewController.router = router
        
        return viewController
    }
}

// MARK: Data passing
protocol SearchViewControllerDataSource: AnyObject {
    var searchHelper: SuffixSearchHelper<CityModel>? { get set }
    var searchCityModels: [CityModel]? { get set }
}

// MARK: View Interface
protocol SearchViewControllerOutputProtocol {
    func search(text: String)
}

// MARK: Interactor Interface
protocol SearchInteractorOutputProtocol {
    func searchSuccess()
}

// MARK: Presenter Interface
protocol SearchPresenterOutputProtocol: AnyObject {
    func searchSuccess()
}

// MARK: Router
protocol SearchRouterProtocol {
    
}

//
//  SplashRouter.swift
//  Assignment
//
//  Created by Solo on 04/03/2022.
//

import Foundation

class SplashRouter {
    weak var viewController: SplashViewController!
    var dataSource: SplashViewControllerDataSource?
}

extension SplashRouter: SplashRouterProtocol {
    func pushToSearch(helper: SuffixSearchHelper<CityModel>) {
        let searchViewController = SearchConfigurator.viewcontroller()
        searchViewController.router.dataSource?.searchHelper = helper
        viewController.navigationController?.pushViewController(searchViewController, animated: true)
    }
}

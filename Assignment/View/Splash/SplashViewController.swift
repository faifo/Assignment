//
//  SplashViewController.swift
//  Assignment
//
//  Created by Solo on 04/03/2022.
//

import UIKit

class SplashViewController : UIViewController {
    
    var output: SplashViewControllerOutputProtocol!
    var router: SplashRouter!
    
    var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var descLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading data, please wait..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        [indicatorView, descLabel].forEach {
            view.addSubview($0)
        }
        
        indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        indicatorView.startAnimating()
        
        descLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descLabel.topAnchor.constraint(equalTo: indicatorView.bottomAnchor, constant: 16).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    }
}


extension SplashViewController: SplashPresenterOutputProtocol {
}

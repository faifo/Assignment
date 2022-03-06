//
//  MapViewController.swift
//  Assignment
//
//  Created by Solo on 06/03/2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var output: MapViewControllerOutputProtocol!
    var router: MapRouter!
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setupViews() {
        view.backgroundColor = .white
        [mapView].forEach {
            view.addSubview($0)
        }
        
        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        if let cityModel = router.dataSource?.cityModel {
            mapView.setCenter(cityModel.coord.coordinate2D, animate: false, in: 0.1)
            title = cityModel.getTitle()
        }
    }
    
    func initData() {
        
    }
}

extension MapViewController: MapPresenterOutputProtocol {
    
}

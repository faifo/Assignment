//
//  MKMapView+Extensions.swift
//  Assignment
//
//  Created by Solo on 06/03/2022.
//

import Foundation
import MapKit

extension MKMapView {
    func setCenter(_ coordinate: CLLocationCoordinate2D, animate: Bool, in degree: CLLocationDegrees) {
        let coordinateRegion =  MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            //        let adjustedRegion = self.regionThatFits(coordinateRegion)
        self.setRegion(coordinateRegion, animated: true)
    }
}

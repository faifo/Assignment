//
//  CityModel.swift
//  Assignment
//
//  Created by Solo on 04/03/2022.
//

import Foundation
import CoreLocation

struct CityModel: Decodable {
    let country: String
    let name: String
    let _id: UInt
    let coord: Coordinate
    
    func getTitle() -> String {
        return "\(name), \(country)"
    }
}

extension CityModel: Searchable {
    var searchText: String {
        return getTitle()
    }
    
    static func == (lhs: CityModel, rhs: CityModel) -> Bool {
        return lhs._id == rhs._id
    }
}

struct Coordinate: Decodable, Hashable {
    let lon: Double
    let lat: Double
    
    var coordinate2D: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.lon == rhs.lon && lhs.lat == rhs.lat
    }
}

//
//  LocationManager.swift
//  Bright Sky Weather App
//
//  Created by Ritesh Khore on 20/06/24.
//

import Foundation
import CoreLocation

final class LocationManager:NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    private let manager = CLLocationManager()
    
    private var location:CLLocation? {
        didSet {
            guard let l = location else {
                    return
            }
            locationFetchCompletion?(l)
        }
    }
    
    private var locationFetchCompletion: ((CLLocation) -> Void)?
    
    public func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {
        self.locationFetchCompletion = completion
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    // MARK: - Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        self.location = location
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {

        print(error)
    }
}

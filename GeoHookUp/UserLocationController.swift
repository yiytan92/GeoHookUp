//
//  UserLocationController.swift
//  GeoHookUp
//
//  Created by Yi Yang  Tan  on 5/27/17.
//  Copyright © 2017 Yi Yang  Tan . All rights reserved.
//

import Foundation
import CoreLocation

class UserLocationController:NSObject,CLLocationManagerDelegate{
    
    static let sharedLocationController:UserLocationController = UserLocationController()
    static var currentLocation:CLLocation? = nil
    static let locationManager:CLLocationManager = CLLocationManager()
    
    class func startGPS(){
        locationManager.delegate = sharedLocationController
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestAlwaysAuthorization()

        if (CLLocationManager.locationServicesEnabled()){
        locationManager.startUpdatingLocation()
        }
        
        
    }
    
    class func stopGPS(){
        locationManager.stopUpdatingLocation()    }
    
    class func deviceLocation() -> CLLocationCoordinate2D{
            return (currentLocation?.coordinate)!
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        UserLocationController.currentLocation = locations[0]
        
    }
}

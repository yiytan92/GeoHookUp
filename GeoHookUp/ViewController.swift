//
//  ViewController.swift
//  GeoHookUp
//
//  Created by Yi Yang  Tan  on 5/27/17.
//  Copyright © 2017 Yi Yang  Tan . All rights reserved.
//

import UIKit
import MapKit
import Foundation
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var userLatitude: UILabel!
    
    @IBOutlet weak var userLongitude: UILabel!
    
    @IBAction func updateLocation(_ sender: Any) {
    }
    var locationManager = CLLocationManager()
    
    var uniqueString:String = UUID().uuidString
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("This is the generated String: \(String(describing:uniqueString))")
    
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        //Zoom to user location
        //set initial zone at USC
        let initialLocation = CLLocation(latitude: 32.8801, longitude: -117.2340)
        centerMapOnLocation(location: initialLocation)
       

    
    }
    


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        userLatitude.text = String(lat)
        userLongitude.text = String(long)
        
        //Do What ever you want with it
    }
    
    let regionRadius: CLLocationDistance = 3000

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


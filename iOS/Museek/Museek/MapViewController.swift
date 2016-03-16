//
//  MapViewController.swift
//  Museek
//
//  Created by Jesse Tipton on 3/15/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        handleAuthorizationStatus(CLLocationManager.authorizationStatus())
        
        reloadData()
    }
    
    private func reloadData() {
        guard let location = currentLocation else { return }
        APIClient.sharedClient.fetchEvents(location: location) { events in
            dispatch_async(dispatch_get_main_queue()) {
                self.mapView.removeAnnotations(self.mapView.annotations)
                self.mapView.addAnnotations(events)
            }
        }
    }
    
    private func handleAuthorizationStatus(status: CLAuthorizationStatus) {
        switch status {
        case .AuthorizedAlways, .AuthorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
        case .Denied, .Restricted:
            fatalError("Location access was denied or restricted.")
        case .NotDetermined:
            locationManager.requestWhenInUseAuthorization()
        }
    }

}

extension MapViewController: CLLocationManagerDelegate {

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        handleAuthorizationStatus(status)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last
    }
    
}

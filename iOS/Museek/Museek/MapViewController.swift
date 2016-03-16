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
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 20)!]
        self.title = "Map"
        
        locationManager.delegate = self
        handleAuthorizationStatus(CLLocationManager.authorizationStatus())
        
        timer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: "reloadData", userInfo: nil, repeats: true)
        timer?.fire()
        
        addPins()
    }
    
    func addPins() {
        for(var index = 0; index < 4; index++){
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = CLLocationCoordinate2DMake(localData.eventLat[index],localData.eventLong[index])
            dropPin.title = localData.locationNames[index]
            mapView.addAnnotation(dropPin)
            
            //Show annotation
            mapView.selectAnnotation(mapView.annotations[index], animated: true)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EventDetail" {
            let eventDetailViewController = segue.destinationViewController as! EventDetailViewController
            eventDetailViewController.event = sender as? Event
        }
    }
    
    func reloadData() {
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
        //currentLocation = locations.last
        
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        let latDelta: CLLocationDegrees = 0.075
        let longDelta: CLLocationDegrees = 0.075
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        mapView.setRegion(region, animated: false)
        
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        performSegueWithIdentifier("EventDetail", sender: view.annotation)
    }
    
}

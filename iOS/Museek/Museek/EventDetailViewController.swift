//
//  ShowDetailViewController.swift
//  Museek
//
//  Created by Eric Rincon on 3/15/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import UIKit
import MapKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var bandNameLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lyftButton: UIButton! {
        didSet {
            lyftButton.setTitleColor(.whiteColor(), forState: .Normal)
            lyftButton.layer.backgroundColor = UIColor(red:0.92, green:0.04, blue:0.55, alpha:1.0).CGColor
            lyftButton.layer.borderColor = UIColor(red:0.92, green:0.04, blue:0.55, alpha:1.0).CGColor
            lyftButton.layer.borderWidth = 1
            lyftButton.layer.cornerRadius = 8
        }
    }
    

    var event: Event? {
        didSet {
            eventNameLabel.text = event?.name.value
            bandNameLabel.text = event?.band.value?.name.value
        }
    }

    @IBAction func requestLyft() {
        let application = UIApplication.sharedApplication()
        let lyftAppURL = NSURL(string: "lyft://ridetype?id=&destination[latitude]=\(0)&destination[longitude]=\(0)")!
        
        if application.canOpenURL(lyftAppURL) {
            application.openURL(lyftAppURL)
        } else {
            let lyftAppStoreURL = NSURL(string: "https://itunes.apple.com/us/app/lyft-on-demand-ridesharing/id529379082?mt=8")!
            application.openURL(lyftAppStoreURL)
        }
    }
    
}

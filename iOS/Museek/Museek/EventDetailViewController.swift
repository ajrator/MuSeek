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

    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var bandNameLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lyftButton: UIButton!
    @IBOutlet weak var eventTextView: UITextView!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func requestLyft() {
        // If Lyft is not installed, send the user to the Apple App Store
        let myApp = UIApplication.sharedApplication()
        let lyftAppURL = NSURL(string: "lyft://ridetype?id=&destination[latitude]=\(0)&destination[longitude]=\(0)")!
        
        if myApp.canOpenURL(lyftAppURL) {
            // Lyft is installed; launch it
            
            myApp.openURL(lyftAppURL)
        } else {
            // Lyft not installed; open App Store
            let lyftAppStoreURL = NSURL(string: "https://itunes.apple.com/us/app/lyft-on-demand-ridesharing/id529379082?mt=8")!
            myApp.openURL(lyftAppStoreURL)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

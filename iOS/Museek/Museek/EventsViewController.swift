//
//  ViewController.swift
//  Museek
//
//  Created by Jesse Tipton on 3/15/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import UIKit
import CoreLocation

class EventsViewController: UITableViewController {

    enum Filter: Int {
        case Time = 0
        case Distance = 1
    }
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func filter(sender: UISegmentedControl) {
        guard let filter = Filter(rawValue: sender.selectedSegmentIndex) else { return }
        reloadData(filter)
    }
 
    private func reloadData(filter: Filter) {
        let client = APIClient.sharedClient
        client.fetchEvents(location: CLLocation()) { events in
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData(.Time)
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ShowCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "hi"
        cell.detailTextLabel?.text = "Hello"
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
}


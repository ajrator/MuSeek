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
    
    var events = [Event]()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func filter(sender: UISegmentedControl) {
        guard let filter = Filter(rawValue: sender.selectedSegmentIndex) else { return }
        reloadData(filter)
    }
 
    private func reloadData(filter: Filter) {
        let client = APIClient.sharedClient
        client.fetchEvents(location: CLLocation()) { events in
            self.events = events.sort { a, b in
                switch filter {
                case .Time:
                    return a.date.value! < b.date.value!
                case .Distance:
                    // FIXME: This should compare distance not time
                    return a.date.value! < b.date.value!
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData(.Time)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EventDetail" {
            let eventDetailViewController = segue.destinationViewController as! EventDetailViewController
            eventDetailViewController.event = events[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ShowCell", forIndexPath: indexPath)
        
        let event = events[indexPath.row]
        
        cell.textLabel?.text = event.band.value?.name.value
        cell.detailTextLabel?.text = "9.8 mi – Rock, metal"

        return cell
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
}

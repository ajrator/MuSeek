//
//  API.swift
//  Museek
//
//  Created by Eric Rincon on 3/15/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

typealias EventFetchCompletionHandler = (events: [Event]) -> Void

class APIClient {
    
    static let sharedClient = APIClient()
    
    func fetchEvents(location location: CLLocation, completionHandler: EventFetchCompletionHandler) {
        Alamofire.request(.GET, "", parameters: nil, encoding: .URL, headers: nil).responseJSON { response in
            completionHandler(events: [])
        }
    }
    
}

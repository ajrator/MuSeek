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
        let URL = "" // TODO: This needs to be the URL we're making the request to
        let parameters: [String: AnyObject] = [:] // TODO: (MAYBE) Parameters for the request (Probably a location in some form? Maybe not?)
        let headers: [String: String] = [:] // TODO: (MAYBE) Headers, typically only used for authentication, we probably don't need it for this app
        Alamofire.request(.GET, "", parameters: parameters, encoding: .URL, headers: headers).responseJSON { response in
            // TODO: Use the `response` object in this closure to convert the JSON blob to an array of Event model objects. If you need help, look at https://github.com/ovenbits/ModelRocket and https://github.com/Alamofire/Alamofire
            completionHandler(events: [])
        }
    }
    
}

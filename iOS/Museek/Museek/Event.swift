//
//  Event.swift
//  Museek
//
//  Created by Jesse Tipton on 3/16/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import Foundation
import ModelRocket
import MapKit

class Event: Model {
    
    let id = Property<String>(key: "id", required: true)
    let name = Property<String>(key: "name", required: true)
    let date = Property<NSDate>(key: "date", required: true)
    let venue = PropertyDictionary<String>(key: "venue", required: true)
    let URLs = PropertyArray<NSURL>(key: "urls")
    
    let band = Property<Band>(key: "band", required: true)
    
}

extension Event: MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
    
    var title: String? {
        return name.value
    }
    
}
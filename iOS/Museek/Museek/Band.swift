//
//  Show.swift
//  Museek
//
//  Created by Jesse Tipton on 3/15/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import Foundation
import MapKit
import ModelRocket

class Band: Model {
    
    let id = Property<String>(key: "id", required: true)
    let name = Property<String>(key: "name", required: true)
    let imageURL = Property<NSURL>(key: "image_url")
    let URLs = PropertyArray<NSURL>(key: "urls")
    
}

extension Band: JSONTransformable {
    
    class func fromJSON(json: JSON) -> Band? {
        return Band(json: json)
    }
    
    func toJSON() -> AnyObject {
        return self.json().dictionary
    }
    
}



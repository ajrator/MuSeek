//
//  LocalTestData.swift
//  Museek
//
//  Created by Ben Wernsman on 3/16/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import Foundation

class LocalTestData {
    
    var bandNames:[String] = ["Carson Mchone","American Sharks","Clara Nova","The Sidewinder"]
    var locationNames:[String] = ["The White Horse","East Austin","Empire Control Room & Garage","Icenhauer's"]
    var eventDescriptions:[String] =
        ["Time: 4:00PM\nCost: Free\nWebsite: carsonmchonemusic.com",
        "Time: 5:00PM\nCost: Free\nWebsite: sharkspartyhard.com",
        "Time: 12:00PM\nCost: Free\nWebsite: clara-nova.com/",
        "Time: 1:00AM\nCost: Free\nWebsite: holidaymountainmusic.com"]
    
    var eventLat:[Double] = [30.2625758,30.270285,30.2674095,30.2594127]
    var eventLong:[Double] = [-97.7270603,-97.7490023,-97.736059,-97.7383437]   
}

let localData = LocalTestData()

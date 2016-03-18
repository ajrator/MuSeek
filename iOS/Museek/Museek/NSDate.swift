//
//  NSDate.swift
//  Museek
//
//  Created by Jesse Tipton on 3/16/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import Foundation

func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}

//
//  BadgeLabel.swift
//  Museek
//
//  Created by Jesse Tipton on 3/16/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import UIKit

class BadgeLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = UIFont.systemFontOfSize(16)
        
        textAlignment = .Center
        textColor = .whiteColor()
        
        layer.backgroundColor = UIColor.grayColor().CGColor
        layer.cornerRadius = 8
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        let size = super.sizeThatFits(size)
        return CGSizeMake(size.width + 16, size.height + 8)
    }
    
}

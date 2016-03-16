//
//  paymentViewController.swift
//  Museek
//
//  Created by Ben Wernsman on 3/16/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import Foundation
import UIKit

class paymentViewController: UIViewController{
    
    @IBOutlet weak var qrCode: UIImageView!
    var index:Int = -1
    
    override func viewDidLoad() {
        print(index)
        self.title = "Donation"
        let myImage:UIImage = UIImage(named: localData.qrCodes[index])!
        qrCode.image = myImage
    }
}

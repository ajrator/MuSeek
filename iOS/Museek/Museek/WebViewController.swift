//
//  WebViewController.swift
//  Museek
//
//  Created by Ben Wernsman on 3/16/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import Foundation
import UIKit


class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var websiteURL:String = ""
    var name:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        
        //print(mainInstance.currentTransaction.paymentURL)
        
        let url = NSURL (string: "http:" + websiteURL);
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
    }
    
}
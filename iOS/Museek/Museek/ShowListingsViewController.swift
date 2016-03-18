//
//  ShowListingsViewController.swift
//  Museek
//
//  Created by Ben Wernsman on 3/16/16.
//  Copyright © 2016 Museek. All rights reserved.
//

import Foundation
import UIKit

class ShowListingsViewController: UIViewController{
    @IBOutlet weak var EventsScrollView: UIScrollView!
    
    var index:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 20)!]
        self.title = "Popular"
        
        self.tabBarController?.tabBar.items![0].title = "Popular"
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let myImages = ["image1.png","image2.png","image3.png","image4.png"]
        let imageWidth:CGFloat = screenSize.width
        var yPosition:CGFloat = 0
        var scrollViewContentSize:CGFloat = 0;
        
        for var index = 0; index < myImages.count; index++
        {
            let myImage:UIImage = UIImage(named: myImages[index])!
            let myImageView:UIImageView = UIImageView()
            
            myImageView.image = myImage
            
            let imageHeight2:CGFloat = myImage.size.height
            let imageWidth2:CGFloat = myImage.size.width
            let imageHeight:CGFloat = (imageHeight2/imageWidth2) * imageWidth
            
            myImageView.contentMode = UIViewContentMode.ScaleAspectFit
            myImageView.frame.size.width = imageWidth
            myImageView.frame.size.height = imageHeight
            myImageView.center = self.view.center
            myImageView.frame.origin.y = yPosition
            myImageView.tag = index
            
            EventsScrollView.addSubview(myImageView)
            
            yPosition += imageHeight + 2
            scrollViewContentSize += imageHeight
            
            let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
            tapGestureRecognizer
            myImageView.userInteractionEnabled = true
            myImageView.addGestureRecognizer(tapGestureRecognizer)
            EventsScrollView.contentSize = CGSize(width:imageWidth, height: scrollViewContentSize)
        }

    }
    
    func imageTapped(img: AnyObject?)    {
        let iv : UIView! = img!.view
        index = iv.tag
        self.performSegueWithIdentifier("showEventDetails", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showEventDetails" {
            let secondVC: EventDetailViewController = segue.destinationViewController as! EventDetailViewController
            secondVC.eventIndex = index
        }
    }
}

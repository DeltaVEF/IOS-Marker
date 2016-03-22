//
//  MarkViewController.swift
//  VEF
//
//  Created by Colin Rosen on 3/8/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit

class MarkViewController : UIViewController {
    
    @IBOutlet weak var TimeLine: UITimeLineView!
    
    @IBAction func MarkerBtnPressed(sender: AnyObject) {
        TimeLine.addMarker()
    }
    
    override func viewDidLoad() {
        // Nothing
    }
}

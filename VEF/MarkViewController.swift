//
//  MarkViewController.swift
//  VEF
//
//  Created by Colin Rosen on 3/8/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit

class MarkViewController : UIViewController {
    
    var timePassed = 0
    
    override func viewDidLoad() {
        NSTimer.scheduledTimerWithTimeInterval (1, target: self, selector: "timer", userInfo: nil, repeats: true)
    }
    
    func timer() {
        timePassed++
    }
}

//
//  FeedbackViewController.swift
//  VEF
//
//  Created by Colin Rosen on 3/8/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit

class FeedbackViewController : UIViewController {
    @IBOutlet weak var Timeline: UISlider!{
        didSet{
            Timeline.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        }
    }
}

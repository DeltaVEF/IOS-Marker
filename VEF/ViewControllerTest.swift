//
//  ViewControllerTest.swift
//  VEF
//
//  Created by Colin Rosen on 3/29/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit

class ViewControllerTest: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = contentView.bounds.size
        scrollView.autoresizingMask = [.FlexibleHeight]
    }

}

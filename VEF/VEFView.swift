//
//  VEFView.swift
//  VEF
//
//  Created by Colin Rosen on 3/30/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit

class VEFView: UIView {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.endEditing(true)
    }

}

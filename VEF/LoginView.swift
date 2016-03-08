//
//  LoginView.swift
//  VEF
//
//  Created by Colin Rosen on 3/7/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit

class LoginView: UIView {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.endEditing(true)
    }
}
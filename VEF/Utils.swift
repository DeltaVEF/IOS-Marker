//
//  Utils.swift
//  VEF
//
//  Created by Colin Rosen on 4/19/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit

public class Utils {
    // Shows an error on the given view
    public static func alert(title: String, message: String, view: UIViewController) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        view.presentViewController(alertController, animated: true, completion: nil)
    }
}

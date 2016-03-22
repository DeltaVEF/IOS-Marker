//
//  UIMarker.swift
//  VEF
//
//  Created by Colin Rosen on 3/22/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit

class UIMarker: UIView {

    var imageView : UIImageView!
    
    init(position: CGPoint, color: UIColor) {
        super.init(frame: CGRect(x: position.x, y : position.y, width: 20, height: 40))
        
        imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: "marker")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        imageView.tintColor = color
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

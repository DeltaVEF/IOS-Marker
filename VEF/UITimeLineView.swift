//
//  UITimeLineView.swift
//  VEF
//
//  Created by Colin Rosen on 3/16/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit

class UITimeLineView: UIView {

    private var timepassed : Double = 0
    private var image : UIImageView!
    private var pointer : UIImageView!
    private let lineWidth : Double = 144
    private let movespeed : Double = 10
    private let fps : Double = 60
    private var centerX : CGFloat!
    private var markers : List<UIMarker> = List<UIMarker>()
    private var markerHolder : UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Get the center coordinate of the screen
        centerX = UIScreen.mainScreen().bounds.width / 2

        // Create timeline
        image = UIImageView(frame: CGRect(x: 0, y: bounds.size.height / 2 - 2.5, width: bounds.size.width, height: 5))
        image.backgroundColor = UIColor(patternImage: UIImage(named: "timeline")!)
        addSubview(image)
        
        // Create pointer
        pointer = UIImageView(frame: CGRect(x: centerX - 10, y: 0, width: 20, height: 20))
        pointer.image = UIImage(named: "pointer")
        addSubview(pointer)
        
        // Create marker holder
        markerHolder = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        addSubview(markerHolder)
        
        // Initiate timer
        NSTimer.scheduledTimerWithTimeInterval(1 / fps, target: self, selector: #selector(UITimeLineView.tick), userInfo: nil, repeats: true)
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: frame.size.width, height: 44)
    }
    
    func tick() {
        image.bounds.origin.x += CGFloat(movespeed / fps)
        
        for marker in markerHolder.subviews {
            marker.frame.origin.x -= CGFloat(movespeed / fps)
            
            if marker.frame.origin.x < -20 {
                marker.removeFromSuperview()
            }
        }
        
        timepassed += 1 / fps
    }
    
    func addMarker(){
        // TODO: HTTP Request
        let marker = UIMarker(position: CGPoint(x: centerX - 10, y: 2), color: UIColor(colorLiteralRed: 0.5, green: 0, blue: 0, alpha: 0.8))
        markers.add(marker)
        markerHolder.addSubview(marker)
    }
}

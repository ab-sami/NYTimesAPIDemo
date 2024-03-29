//
//  LoadingView.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    static let shared = LoadingView()
    
    var activityIndicatorView : UIActivityIndicatorView?
    var backgroundView : UIImageView?
    
    func show(_ controller: UIViewController, _ position: LoadingPosition = .middle) {
        
        if(controller.view.subviews.contains(self)) {
            return
        }
        
        let superSize = controller.view.frame.size
        self.frame = controller.view.bounds
        
        if activityIndicatorView == nil {
            activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        }
        
        if backgroundView == nil {
            backgroundView = UIImageView()
        }
        
        var frame = CGRect()
        let h2 = superSize.height/2
        
        switch position {
        case .bottom:
            backgroundView!.image = "reverseGradient".img()
            frame = CGRect(x: 0, y: h2, width: superSize.width, height: h2)
            backgroundView!.alpha = 0.9
        case .top:
            backgroundView!.image = "blackGradient".img()
            frame = CGRect(x: 0, y: 0, width: superSize.width, height: h2)
            backgroundView!.alpha = 0.9
        case .middle:
            backgroundView!.image = "rdBGImage".img()
            frame = CGRect(x: 0, y: 0, width: superSize.width, height: superSize.height)
            backgroundView!.alpha = 0.6
        }
        
        backgroundView!.frame = frame
        
        activityIndicatorView!.center = backgroundView!.center
        addSubview(backgroundView!)
        addSubview(activityIndicatorView!)
        controller.view.addSubview(self)
        controller.view.bringSubviewToFront(self)
        activityIndicatorView!.startAnimating()
    }
    
    func hide() {
        guard self.superview != nil else { return }
        removeFromSuperview()
    }
    
}

//
//  ProgressView.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 9/1/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    private var innerProgress: CGFloat = 0.0
    var progress : CGFloat {
        set(newProgress) {
            if newProgress > 1.0 {
                innerProgress = 1.0
            } else if newProgress < 0.0 {
                innerProgress = 0
            } else {
                innerProgress = newProgress
            }
            
            setNeedsDisplay()
        }
        
        get {
            return innerProgress * bounds.width
        }
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        MinimalStyles.drawProgressView(frame: bounds, number: progress)
    }

}

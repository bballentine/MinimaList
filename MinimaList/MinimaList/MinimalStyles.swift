//
//  MinimalStyles.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 9/1/16.
//  Copyright (c) 2016 Brandon Ballentine. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class MinimalStyles : NSObject {

    //// Cache

    private struct Cache {
        static let darkText: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        static let priorityHigh: UIColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1.000)
        static let priorityMedium: UIColor = UIColor(red: 0.898, green: 0.902, blue: 0.906, alpha: 1.000)
        static let priorityLow: UIColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.000)
        static let progressBackground: UIColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1.000)
        static let callOut: UIColor = UIColor(red: 0.118, green: 0.694, blue: 0.988, alpha: 1.000)
    }

    //// Colors

    public class var darkText: UIColor { return Cache.darkText }
    public class var priorityHigh: UIColor { return Cache.priorityHigh }
    public class var priorityMedium: UIColor { return Cache.priorityMedium }
    public class var priorityLow: UIColor { return Cache.priorityLow }
    public class var progressBackground: UIColor { return Cache.progressBackground }
    public class var callOut: UIColor { return Cache.callOut }

    //// Drawing Methods

    public class func drawProgressView(frame frame: CGRect = CGRect(x: 0, y: 0, width: 375, height: 120), number: CGFloat = 375) {

        //// Background Drawing


        //// Progress Drawing
        let progressPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: number, height: 120))
        MinimalStyles.priorityMedium.setFill()
        progressPath.fill()
    }

}

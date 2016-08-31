//
//  MinimalStyles.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/31/16.
//  Copyright (c) 2016 Brandon Ballentine. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class MinimalStyles : NSObject {

    //// Cache

    private struct Cache {
        static let darkText: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        static let priorityHigh: UIColor = UIColor(red: 0.286, green: 0.290, blue: 0.294, alpha: 1.000)
        static let priorityMedium: UIColor = UIColor(red: 0.733, green: 0.737, blue: 0.741, alpha: 1.000)
        static let priorityLow: UIColor = UIColor(red: 0.898, green: 0.902, blue: 0.906, alpha: 1.000)
        static let progressBackground: UIColor = UIColor(red: 0.898, green: 0.902, blue: 0.906, alpha: 1.000)
    }

    //// Colors

    public class var darkText: UIColor { return Cache.darkText }
    public class var priorityHigh: UIColor { return Cache.priorityHigh }
    public class var priorityMedium: UIColor { return Cache.priorityMedium }
    public class var priorityLow: UIColor { return Cache.priorityLow }
    public class var progressBackground: UIColor { return Cache.progressBackground }

    //// Drawing Methods

    public class func drawCanvas1() {
    }

}

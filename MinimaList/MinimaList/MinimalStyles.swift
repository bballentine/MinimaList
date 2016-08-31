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
        static let priorityHigh: UIColor = UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1.000)
        static let priorityMedium: UIColor = UIColor(red: 0.839, green: 0.839, blue: 0.839, alpha: 1.000)
        static let priorityLow: UIColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1.000)
        static let progressBackground: UIColor = UIColor(red: 0.894, green: 0.886, blue: 0.898, alpha: 1.000)
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

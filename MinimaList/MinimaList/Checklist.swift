//
//  Checklist.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/24/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    var name = ""
    var items = [ChecklistItem]()
    
    var percentComplete: Double {
        
        return Double(complete) / Double(self.items.count)
    }
    
    var complete: Int {
        var numberComplete: Int = 0
        for item in items {
            if item.complete {
                numberComplete += 1
            }
        }
        
        return numberComplete
    }
    
    var remaining: Int {
        var numberRemaining: Int = 0
        for item in items {
            if item.complete == false {
                numberRemaining += 1
            }
        }
        
        return numberRemaining
    }
    
    init(name: String) {
        self.name = name
        
        super.init()
    }
    
    
}

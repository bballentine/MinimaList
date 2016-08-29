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
        var numberComplete: Double = 0
        for item in items {
            if item.complete{
                numberComplete += 1
            }
        }
        return numberComplete / Double(self.items.count)
    }
    
    init(name: String) {
        self.name = name
        
        super.init()
    }
    
    
}

//
//  ChecklistItem.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/24/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import UIKit

enum Priority: Int {
    case Low = 0
    case Medium = 1
    case High = 2
}

class ChecklistItem: NSObject {
    var name: String
    var complete: Bool
    var priority: Priority
    
    init(name: String, priority: Priority) {
        self.name = name
        self.complete = false
        self.priority = priority
        
        super.init()
        
    }
    
    func toggleComplete() {
        complete = !complete
    }
}

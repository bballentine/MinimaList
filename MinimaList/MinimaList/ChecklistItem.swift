//
//  ChecklistItem.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/24/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//
import Foundation
import UIKit

enum Priority: Int {
    case Low = 0
    case Medium = 1
    case High = 2
}

class ChecklistItem: NSObject, NSCoding {
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
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        complete = aDecoder.decodeBool(forKey: "Complete")
        priority = Priority(rawValue: aDecoder.decodeInteger(forKey: "Priority"))!
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(complete, forKey: "Complete")
        aCoder.encode(priority.rawValue, forKey: "Priority")
    }
}

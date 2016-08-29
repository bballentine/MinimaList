//
//  ChecklistItem.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/24/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import UIKit

class ChecklistItem: NSObject {
    var name: String
    var detail: String
    var complete: Bool
    
    init(name: String, detail: String) {
        self.name = name
        self.detail = detail
        self.complete = false
        
        super.init()
        
    }
}

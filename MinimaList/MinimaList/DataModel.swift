//
//  DataModel.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/29/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    init() {
        loadChecklists()
        registerDefaults()
        loadSampleData()
    }
    
    
    func dataFilePath() -> URL {
        let documentsURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentsURL.appendingPathComponent("Checklists.plist")
        
        return fileURL
    }
    
    func saveChecklists() {
        print("Saving")
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(lists, forKey: "Checklists")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    
    func loadChecklists() {
        if let docs = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let path = (docs as NSString).appendingPathComponent("Checklists.plist")
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
                lists = unarchiver.decodeObject(forKey: "Checklists") as! [Checklist]
                unarchiver.finishDecoding()
                print("File found and loaded")
            } else {
                print("File not found")
            }

        }
    }
    
    func loadSampleData() {
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        
        if firstTime {
            let checklist1 = Checklist(name: "Getting Started List. Tap here to view items or swipe for other options")
            let checklistItem1 = ChecklistItem(name: "Tap the + icon to add a new item.", priority: .High)
            checklistItem1.complete = true
            let checklistItem2 = ChecklistItem(name: "Tap the cell to mark this item as complete.", priority: .Medium)
            let checklistItem3 = ChecklistItem(name: "Swipe to edit or delete an item.", priority: .Low)
            checklist1.items.append(checklistItem1)
            checklist1.items.append(checklistItem2)
            checklist1.items.append(checklistItem3)
            self.lists.append(checklist1)
            
            userDefaults.set(false, forKey: "FirstTime")
            userDefaults.synchronize()
        }
    }
    
    func registerDefaults() {
        let dictionary = ["FirstTime": true]
        UserDefaults.standard.register(defaults: dictionary)
    }

}

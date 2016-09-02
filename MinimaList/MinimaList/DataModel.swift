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
}

//
//  AllListsViewController.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/24/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    var checklistArray: [Checklist] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120.0
        
        // Add image to navbar
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 180, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "header-icon")
        imageView.image = image
        navigationItem.titleView = imageView
        
        
        // Create checklist for testing
        let checklist1 = Checklist(name: "iOSI Project 1")
        let checklistItem1 = ChecklistItem(name: "Create user interface in Sketch", detail: "This is the detail text for an item")
        checklistItem1.complete = true
        let checklistItem2 = ChecklistItem(name: "Create storyboard for UI testing", detail: "This should show up in a less prominent color")
        checklist1.items.append(checklistItem1)
        checklist1.items.append(checklistItem2)
        checklistArray.append(checklist1)
        
        let checklist2 = Checklist(name: "My other iOS Project - PSCC")
        let checklistItem3 = ChecklistItem(name: "Create user interface in Sketch", detail: "This is the detail text for an item")
        checklistItem3.complete = true
        let checklistItem4 = ChecklistItem(name: "Create storyboard for UI testing", detail: "This should show up in a less prominent color")
        let checklistItem5 = ChecklistItem(name: "A totally different item", detail: "Some detail info")
        checklist2.items.append(checklistItem3)
        checklist2.items.append(checklistItem4)
        checklist2.items.append(checklistItem5)
        checklistArray.append(checklist2)
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(checklistArray.count)
        return checklistArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistCell", for: indexPath) as! ChecklistCell

        // Configure the cell...
        let checklist = checklistArray[indexPath.row]
        cell.checklistTitle.text = checklist.name
        cell.setupProgress(percentageComplete: checklist.percentComplete)
        

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ChecklistViewController.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/24/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddChecklistItemViewControllerDelegate {
    var checklist: Checklist!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = checklist.name
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120.0

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return checklist.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ChecklistItemCell
        let item = checklist.items[indexPath.row]

        // Configure the cell...
        configureCell(cell: cell, listItem: item)

        return cell
    }
    
    func configureCell(cell: ChecklistItemCell, listItem: ChecklistItem) {
        switch listItem.priority {
        case .Low:
            cell.backgroundColor = MinimalStyles.priorityLow
        case .Medium:
            cell.backgroundColor = MinimalStyles.priorityMedium
        case .High:
            cell.backgroundColor = MinimalStyles.priorityHigh
        }
        
        cell.itemTitle.text = listItem.name
        
        if listItem.complete {
            cell.completeIcon.image = #imageLiteral(resourceName: "complete")
        } else {
            cell.completeIcon.image = #imageLiteral(resourceName: "incomplete")
        }
        
    }
    
    @IBAction func addItemPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "AddItem", sender: self)
    }
    
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { action, index in
            self.checklist.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            let itemToEdit = self.checklist.items[indexPath.row]
            self.performSegue(withIdentifier: "EditItem", sender: itemToEdit)
        }
        
        return [delete, edit]
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            checklist.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ChecklistItemCell {
            let checklistItem = checklist.items[indexPath.row]
            checklistItem.toggleComplete()
            configureCell(cell: cell, listItem: checklistItem)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

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
    
    // MARK: - AddChecklistItemVC Delegate Methods
    
    func addChecklistItemViewControllerDidCancel(controller: AddChecklistItemViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addChecklistItemViewController(controller: AddChecklistItemViewController, didAddChecklistItem item: ChecklistItem) {
        checklist.items.append(item)
        dismiss(animated: true, completion: nil)
    }
    
    func addChecklistItemViewController(controller: AddChecklistItemViewController, didEditChecklistItem item: ChecklistItem) {
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }

     // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddChecklistItemViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddChecklistItemViewController
            controller.delegate = self
            controller.checklistItemToEdit = sender as? ChecklistItem
        }
    }

}

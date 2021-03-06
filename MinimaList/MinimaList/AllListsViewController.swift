//
//  AllListsViewController.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/24/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController, AddChecklistViewControllerDelegate{
    
    var dataModel: DataModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.lists.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistCell", for: indexPath) as! ChecklistCell

        // Configure the cell...
        let checklist = dataModel.lists[indexPath.row]
        configureCell(cell: cell, forList: checklist)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedList = dataModel.lists[indexPath.row]
        
        performSegue(withIdentifier: "ListDetail", sender: selectedList)
        
    }
    
    // MARK: Add Checklist Delegate
    func addChecklistViewControllerDidCancel(controller: AddCheckistViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addChecklistViewController(controller: AddCheckistViewController, didFinishAddingChecklist checklist: Checklist) {
        dataModel.lists.append(checklist)
        dismiss(animated: true, completion: nil)
    }
    
    func addChecklistViewController(controller: AddCheckistViewController, didFinishEditingChecklist checklist: Checklist) {
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Cell Configuration

    func configureCell(cell: ChecklistCell, forList list: Checklist) {
        
        cell.checklistTitle.text = list.name
        
        if list.calculatePercent() .isNormal {
            cell.progressIndicator.progress = CGFloat(list.calculatePercent())
        } else {
            cell.progressIndicator.progress = 0.0
        }
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { action, index in
            self.dataModel.lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            let listToEdit = self.dataModel.lists[indexPath.row]
            self.performSegue(withIdentifier: "EditChecklist", sender: listToEdit)
        }
        
        return [delete, edit]
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dataModel.lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ChecklistCell
        cell.contentView.clipsToBounds = true
    }


    @IBAction func addButtonPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "AddChecklist", sender: sender)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddChecklist" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddCheckistViewController
            controller.delegate = self
        } else if segue.identifier == "ListDetail" {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as! Checklist
        } else if segue.identifier == "EditChecklist" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddCheckistViewController
            controller.delegate = self
            controller.checklistToEdit = (sender as! Checklist)
        }
        
    }

}

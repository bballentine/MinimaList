//
//  AddChecklistItemViewController.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/31/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import UIKit

protocol AddChecklistItemViewControllerDelegate: class {
    func addChecklistItemViewControllerDidCancel(controller: AddChecklistItemViewController)
    func addChecklistItemViewController(controller: AddChecklistItemViewController, didAddChecklistItem item: ChecklistItem)
}

class AddChecklistItemViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var priorityControl: UISegmentedControl!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    weak var delegate: AddChecklistItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        titleLabel.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textChanged(_ sender: AnyObject) {
        if (titleLabel.text?.characters.count)! > 0 {
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        delegate?.addChecklistItemViewControllerDidCancel(controller: self)
    }
    
    @IBAction func doneButtonPressed(_ sender: AnyObject) {
        let newTitle = titleLabel.text
        let newDetail = descriptionLabel.text
        let newPriority: Priority = Priority(rawValue: priorityControl.selectedSegmentIndex) ?? .Medium
        let newChecklistItem = ChecklistItem(name: newTitle!, detail: newDetail!, priority: newPriority)

        delegate?.addChecklistItemViewController(controller: self, didAddChecklistItem: newChecklistItem)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

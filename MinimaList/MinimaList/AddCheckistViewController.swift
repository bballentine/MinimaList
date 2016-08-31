//
//  AddCheckistViewController.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/29/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import UIKit

protocol AddChecklistViewControllerDelegate: class {
    func addChecklistViewControllerDidCancel(controller: AddCheckistViewController)
    func addChecklistViewController(controller: AddCheckistViewController, didFinishAddingChecklist checklist: Checklist)
}

class AddCheckistViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: AddChecklistViewControllerDelegate?
    

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
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
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        delegate?.addChecklistViewControllerDidCancel(controller: self)
    }
    
    @IBAction func textFieldChanged(_ sender: AnyObject) {
        
        if (titleLabel.text?.characters.count)! > 0 {
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
    @IBAction func doneButtonPressed(_ sender: AnyObject) {
        if let newChecklistName = titleLabel.text {
            let newChecklist = Checklist(name: newChecklistName)
            delegate?.addChecklistViewController(controller: self, didFinishAddingChecklist: newChecklist)
        }
        
        
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

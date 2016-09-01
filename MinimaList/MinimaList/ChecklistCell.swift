//
//  ChecklistCell.swift
//  MinimaList
//
//  Created by Brandon Ballentine on 8/24/16.
//  Copyright © 2016 Brandon Ballentine. All rights reserved.
//

import UIKit

class ChecklistCell: UITableViewCell {
    
    @IBOutlet weak var checklistTitle: UILabel!
    @IBOutlet weak var progressIndicator: ProgressView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

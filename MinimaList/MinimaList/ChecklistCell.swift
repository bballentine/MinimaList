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
    @IBOutlet weak var progressIndicator: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupProgress(percentageComplete: Double) {
        let cellDimensions = self.bounds
        let width = Double(cellDimensions.width)
        let height = Double(cellDimensions.height)
        let progressWidth = width * percentageComplete
        let myRect = CGRect(x: 0, y: 0, width: progressWidth, height: height)
        let progressView = UIView(frame: myRect)
        progressView.backgroundColor = MinimalStyles.progressBackground
        progressIndicator.addSubview(progressView)
    }
    

}

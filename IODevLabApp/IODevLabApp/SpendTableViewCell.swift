//
//  SpendTableViewCell.swift
//  IODevLabApp
//
//  Created by Anjin on 10/31/24.
//

import UIKit

class SpendTableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var spendValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

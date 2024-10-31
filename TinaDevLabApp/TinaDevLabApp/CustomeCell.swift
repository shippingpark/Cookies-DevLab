//
//  CustomeCell.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 11/1/24.
//

import UIKit

class CustomeCell: UITableViewCell {
    
    @IBOutlet weak var spendOutputView: UIView!
    @IBOutlet weak var spendOutputLabel: UILabel!
    @IBOutlet weak var spendUnitLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

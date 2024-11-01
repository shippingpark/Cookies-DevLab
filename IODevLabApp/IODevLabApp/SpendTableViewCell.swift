//
//  SpendTableViewCell.swift
//  IODevLabApp
//
//  Created by Anjin on 10/31/24.
//

import UIKit

class SpendTableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var spendValueLabel: UILabel!
    var deleteAction: () -> Void = {} // action을 전달하는 아주 좋은 방법인지 모르게써요,,
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        deleteAction()
    }
}

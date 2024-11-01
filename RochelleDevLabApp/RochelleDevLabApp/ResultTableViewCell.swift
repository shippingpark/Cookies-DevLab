//
//  ResultTableViewCell.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 11/1/24.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var afterButtonPressed: UIView!
    @IBOutlet weak var resultLabelUnit: UILabel!
    @IBOutlet weak var resultLabelDelete: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

//
//  ExpenseCell.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 11/2/24.
//

import UIKit

class ExpenseCell: UITableViewCell {
  
  let expenseLabel = UILabel()
  let deleteButton = UIButton()
  let unitLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    expenseLabel.font = .systemFont(ofSize: 16)
    expenseLabel.textColor = .black
    expenseLabel.textAlignment = .right
    
    deleteButton.setTitle("X", for: .normal)
    deleteButton.setTitleColor(.black, for: .normal)
    contentView.addSubview(deleteButton)
    contentView.addSubview(expenseLabel)
    contentView.addSubview(unitLabel)

    
    unitLabel.font = .systemFont(ofSize: 16)
    unitLabel.textColor = .black
    unitLabel.text = "원"
    
    deleteButton.translatesAutoresizingMaskIntoConstraints = false
    expenseLabel.translatesAutoresizingMaskIntoConstraints = false
    unitLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([

      deleteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
      deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      deleteButton.widthAnchor.constraint(equalToConstant: 20),
      
      expenseLabel.trailingAnchor.constraint(equalTo: unitLabel.leadingAnchor, constant: -10),
      expenseLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      unitLabel.leadingAnchor.constraint(equalTo: expenseLabel.trailingAnchor, constant: 5),
      unitLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      unitLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with expense: String) {
    expenseLabel.text = expense
  }
}

//
//  ExpenseCell.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 11/2/24.
//

import UIKit

class ExpenseCell: UITableViewCell {
  
  let amountLabel = UILabel()
  let unitLabel = UILabel()
  let deleteButton = UIButton(type: .system)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
    setupContainerView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupContainerView() {
    contentView.backgroundColor = .systemGray6
    contentView.layer.cornerRadius = 25
    contentView.layer.masksToBounds = true
  }
  
  private func setupUI() {
    deleteButton.setTitle("X", for: .normal)
    deleteButton.setTitleColor(.black, for: .normal)
    
    unitLabel.text = "원"
    
    amountLabel.textColor = .black
    amountLabel.font = .systemFont(ofSize: 16)
    
    let stackView = UIStackView(arrangedSubviews: [deleteButton, amountLabel, unitLabel])
    stackView.axis = .horizontal
    stackView.spacing = 10
    stackView.alignment = .center
    
    contentView.addSubview(stackView)
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
    ])
  }
  
  func configure(with amount: String) {
    amountLabel.text = amount
  }
}

//
//  ExpenseCell.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 11/2/24.
//

import UIKit

protocol ExpenseCellDelegate: AnyObject {
  func didTapDeleteButton(on cell: ExpenseCell)
}

class ExpenseCell: UITableViewCell {
  
  weak var delegate: ExpenseCellDelegate?
  let expenseLabel = UILabel()
  let deleteButton = UIButton()
  let unitLabel = UILabel()
  let containerView = UIView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    // 컨테이너 뷰 설정
    containerView.backgroundColor = .systemGray6
    containerView.layer.cornerRadius = 20
    contentView.addSubview(containerView)
    
    let expenseFont = UIFont.preferredFont(forTextStyle: .body)
    expenseLabel.font = UIFontMetrics.default.scaledFont(for: expenseFont)
    expenseLabel.adjustsFontForContentSizeCategory = true // 다이나믹 폰트 사용
    expenseLabel.textColor = .black
    expenseLabel.textAlignment = .right
    
    let deleteButtonFont = UIFont.preferredFont(forTextStyle: .body)
    deleteButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: deleteButtonFont) // 다이나믹 폰트 적용
    deleteButton.titleLabel?.adjustsFontForContentSizeCategory = true
    deleteButton.setTitle("X", for: .normal)
    deleteButton.setTitleColor(.black, for: .normal)
    deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    
    let unitFont = UIFont.preferredFont(forTextStyle: .body)
    unitLabel.font = UIFontMetrics.default.scaledFont(for: unitFont)
    unitLabel.adjustsFontForContentSizeCategory = true // 다이나믹 폰트 사용
    unitLabel.textColor = .black
    unitLabel.text = "원"
    
    containerView.addSubview(deleteButton)
    containerView.addSubview(expenseLabel)
    containerView.addSubview(unitLabel)
    
    // 오토 레이아웃 설정
    deleteButton.translatesAutoresizingMaskIntoConstraints = false
    expenseLabel.translatesAutoresizingMaskIntoConstraints = false
    unitLabel.translatesAutoresizingMaskIntoConstraints = false
    containerView.translatesAutoresizingMaskIntoConstraints = false
    
    // 컨테이너 뷰 오토 레이아웃 설정
    NSLayoutConstraint.activate([
      // 컨테이너 뷰 위치 설정
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
      
      // X 버튼 위치 설정
      deleteButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 17),
      deleteButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      deleteButton.widthAnchor.constraint(equalToConstant: 20),
      
      // 지출 레이블 위치 설정 (X 버튼 오른쪽에 고정)
      expenseLabel.trailingAnchor.constraint(equalTo: unitLabel.leadingAnchor, constant: -10),
      expenseLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      
      // 원 단위 레이블 위치 설정
      unitLabel.leadingAnchor.constraint(equalTo: expenseLabel.trailingAnchor, constant: 5),
      unitLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      unitLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -17)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with expense: String) {
    expenseLabel.text = expense
  }
  
  @objc private func deleteButtonTapped() {
    delegate?.didTapDeleteButton(on: self)
  }
}

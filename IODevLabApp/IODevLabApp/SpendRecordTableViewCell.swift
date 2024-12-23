//
//  SpendRecordTableViewCell.swift
//  IODevLabApp
//
//  Created by Anjin on 11/2/24.
//

import UIKit

class SpendRecordTableViewCell: UITableViewCell {
    
    static let identifier = "SpendRecordTableViewCell"
    
    private let background = UIView().set {
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 20
    }
    
    private var spendLabel = UILabel().set {
        $0.text = "2000"
        $0.font = UIFont.preferredFont(forTextStyle: .body)
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = .black
    }
    
    private let unitLabel = UILabel().set {
        $0.text = "원"
        $0.font = UIFont.preferredFont(forTextStyle: .body)
        $0.textColor = .black
    }
    
    private let deleteButton = UIButton().set {
        $0.setTitle("X", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        $0.titleLabel?.adjustsFontForContentSizeCategory = true
        $0.backgroundColor = .clear
    }
    
    var deleteAction: () -> Void = {}

    // 셀 초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutCellView()
        buttonActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutCellView() {
        contentView.addSubview(background)
        NSLayoutConstraint.activate([
            background.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            background.heightAnchor.constraint(equalToConstant: 40),
            background.topAnchor.constraint(equalTo: contentView.topAnchor),
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        background.addSubview(spendLabel)
        NSLayoutConstraint.activate([
            spendLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            spendLabel.centerYAnchor.constraint(equalTo: background.centerYAnchor)
        ])
        
        background.addSubview(unitLabel)
        NSLayoutConstraint.activate([
            unitLabel.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            unitLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -12)
        ])
        
        background.addSubview(deleteButton)
        NSLayoutConstraint.activate([
            deleteButton.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 12)
        ])
    }
    
    private func buttonActions() {
        deleteButton.addTarget(self, action: #selector(deleteSpend), for: .touchUpInside)
    }
    
    @objc private func deleteSpend() {
        deleteAction()
    }
    
    func setSpendLabelText(_ text: String) {
        spendLabel.text = text
    }
}

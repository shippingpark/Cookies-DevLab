//
//  SpendTableViewCell.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 11/2/24.
//

import UIKit

// delegate 프로토콜 채택
protocol SpendTableViewCellDelegate: AnyObject {
    func didTapDeleteButton(in cell: SpendTableViewCell)
}

final class SpendTableViewCell: UITableViewCell {
    
    weak var delegate: SpendTableViewCellDelegate?
    
    //배경
    private lazy var cellBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 28
        view.layer.masksToBounds = true
        
        view.addSubview(spendUnitLabel)
        view.addSubview(spendOutputLabel)
        view.addSubview(deleteButton)
        
        return view
    }()
    
    //지출금액
    public lazy var spendOutputLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        
        return label
    }()
    
    //원
    private lazy var spendUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "원"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        
        return label
    }()
    
    //X버튼
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("X", for: .normal)
        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // 초기화 메서드 - 스타일과 재사용 식별자를 매개변수로 받아 초기화를 수행
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Nib 파일로부터 객체가 초기화된 후 호출되는 메서드
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // 셀의 선택 상태가 변경될 때 호출되는 메서드
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    // 공통 초기화 작업을 수행하는 메서드
    private func layoutCellView() {
        contentView.addSubview(cellBackground)
        
        cellBackground.translatesAutoresizingMaskIntoConstraints = false
        spendOutputLabel.translatesAutoresizingMaskIntoConstraints = false
        spendUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cellBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            cellBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            cellBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            cellBackground.heightAnchor.constraint(equalToConstant: 50),
            
            spendUnitLabel.centerYAnchor.constraint(equalTo: cellBackground.centerYAnchor),
            spendUnitLabel.trailingAnchor.constraint(equalTo: cellBackground.trailingAnchor, constant: -20),
            
            spendOutputLabel.leadingAnchor.constraint(equalTo: cellBackground.leadingAnchor, constant: 8),
            spendOutputLabel.centerYAnchor.constraint(equalTo: cellBackground.centerYAnchor),
            
            deleteButton.centerYAnchor.constraint(equalTo: cellBackground.centerYAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: cellBackground.leadingAnchor, constant: 40),
           
        ])
    }
    
    @objc private func deleteButtonTapped() {
        print("셀 삭제")
            delegate?.didTapDeleteButton(in: self)
        }
    
}

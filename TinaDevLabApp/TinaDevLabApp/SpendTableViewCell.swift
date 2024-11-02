//
//  SpendTableViewCell.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 11/2/24.
//

import UIKit

class SpendTableViewCell: UITableViewCell {
    
    //배경
    private lazy var background: UIView = {
        background.backgroundColor = UIColor.lightGray
        background.layer.cornerRadius = 28
        background.layer.masksToBounds = true
        
        return background
    }()
    
    //지출금액
    
    private lazy var spendOutputLabel: UILabel = {
        spendOutputLabel.font = UIFont.systemFont(ofSize: 14)
        spendOutputLabel.textColor = .black
        
        return spendOutputLabel
    }()
    
    //원
    private lazy var spendUnitLabel: UILabel = {
        spendUnitLabel.text = "원"
        spendUnitLabel.font = UIFont.systemFont(ofSize: 14)
        spendUnitLabel.textColor = .black
        
        return spendUnitLabel
    }()
    
    //X버튼
    
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
        // Initialization code
    }

    // 셀의 선택 상태가 변경될 때 호출되는 메서드
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // 공통 초기화 작업을 수행하는 메서드
    private func layoutCellView() {
        
    }

}

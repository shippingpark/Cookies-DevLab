//
//  ViewController.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 10/30/24.
//

import UIKit

// 프로토콜 ? 자격증
// self ? 나 자신
// class - UIKit 자아가 있는 타입
// struct: 불변, 통일 X
// class: 하나의 identity
// 재사용 ? 컨베이어벨트 - 문법이 아님


class ViewController: UIViewController {
    
    // 지출 금액을 입력하는 텍스트뷰
    private lazy var spendTextFieldView: UIView =  {
        let view = UIView()
        
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        
        return view
    }()
    
    // 지출 금액을 입력하는 텍스트필드
    
    override func viewDidLoad() {
        
    }
        
    }
    


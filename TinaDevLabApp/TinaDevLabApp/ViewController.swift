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
    
    private let tableView = UITableView()

    
    // 지출 금액을 입력하는 텍스트뷰
    private lazy var spendTextFieldView: UIView =  {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 28
        view.layer.masksToBounds = true
        
        // spendTextFieldView에 텍스트필드, 버튼 올리기
        view.addSubview(spendTextField)
        view.addSubview(spendButton)
        
        return view
    }()
    
    // 지출 금액을 입력하는 텍스트필드
    private lazy var spendTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 50
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.tintColor = .black
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .numberPad
        
        return tf
    }()
    
    // 지출 금액을 입력하는 버튼
    private let spendButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("지출", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI () {
        
        //spendTextFieldView를 view에 올리기
        view.addSubview(spendTextFieldView)
        
        //오토레이아웃 설정
        spendTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        
        spendTextField.translatesAutoresizingMaskIntoConstraints = false
        spendButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
//            spendTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
//            spendTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
//            spendTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 128),
//            
            spendTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spendTextFieldView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            spendTextFieldView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9), // 비율
            spendTextFieldView.heightAnchor.constraint(equalToConstant: 50),
            
      
            spendButton.widthAnchor.constraint(equalTo: spendTextFieldView.widthAnchor, multiplier: 0.15),
            spendButton.trailingAnchor.constraint(equalTo: spendTextFieldView.trailingAnchor, constant: -11),
            spendButton.topAnchor.constraint(equalTo: spendTextFieldView.topAnchor, constant: 9),
            spendButton.bottomAnchor.constraint(equalTo: spendTextFieldView.bottomAnchor, constant: -9),
            
            spendTextField.topAnchor.constraint(equalTo: spendTextFieldView.topAnchor, constant: 17),
            spendTextField.bottomAnchor.constraint(equalTo: spendTextFieldView.bottomAnchor, constant: -17),
            spendTextField.leadingAnchor.constraint(equalTo: spendTextFieldView.leadingAnchor, constant: 22),
            spendTextField.trailingAnchor.constraint(equalTo: spendButton.trailingAnchor, constant: -15)
            
        ])
    
        
        
    }
        
    }
    


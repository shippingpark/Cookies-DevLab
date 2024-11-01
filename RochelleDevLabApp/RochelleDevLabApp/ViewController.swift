//
//  ViewController.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 10/30/24.
//

import UIKit

class ViewController: UIViewController {
  
  // UI 요소 정의
  let containerView = UIView()
  let textField = UITextField()
  let button = UIButton(type: .system)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    // ContainerView 설정
    containerView.backgroundColor = .systemGray6
    containerView.layer.cornerRadius = 25
    view.addSubview(containerView)
    
    // ContainerView 오토레이아웃 설정
    containerView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150),
      containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
      containerView.heightAnchor.constraint(equalToConstant: 50)
    ])
    
    // StackView 설정
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 10
    stackView.distribution = .fill
    containerView.addSubview(stackView)
    
    // StackView 오토레이아웃 설정
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
      stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
      stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
      stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
    ])
    
    // TextField 설정
    textField.borderStyle = .none
    textField.placeholder = "금액을 입력해주세요"
    textField.backgroundColor = .none
    textField.keyboardType = .numberPad
    
    // Button 설정
    button.setTitle("지출", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 15
    
    // StackView에 TextField, Button 추가
    stackView.addArrangedSubview(textField)
    stackView.addArrangedSubview(button)
    
    // Button 액션 추가
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    
    // TextField 너비, 비율 조정
    textField.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8).isActive = true
    button.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.15).isActive = true
  }
  
  // Button 클릭 시 동작
  @objc func buttonTapped() {
    print("Button tapped with text: \(textField.text ?? "")")
  }
}

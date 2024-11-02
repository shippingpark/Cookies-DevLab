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
  let tableView = UITableView()
  
  // 데이터를 저장할 배열
  var expenses: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    setupContainerView()
    setupTableView()
    setupButtonAction()
    
    // ExpenseCell을 셀로 등록
    tableView.register(ExpenseCell.self, forCellReuseIdentifier: "ExpenseCell")
  }
  
  func setupContainerView() {
    // ContainerView 설정
    containerView.backgroundColor = .systemGray6
    containerView.layer.cornerRadius = 25
    view.addSubview(containerView)
    
    // ContainerView 오토레이아웃 설정
    containerView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150),
      containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
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
    textField.keyboardType = .numberPad
    
    // Button 설정
    button.setTitle("지출", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 15
    
    // StackView에 TextField, Button 추가
    stackView.addArrangedSubview(textField)
    stackView.addArrangedSubview(button)
    
    // TextField 너비 비율 조정
    textField.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8).isActive = true
    button.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.15).isActive = true
  }
  
  func setupTableView() {
    tableView.dataSource = self
    
    // TableView 설정
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
    tableView.rowHeight = 50
    
  }
  
  func setupButtonAction() {
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  }
  
  @objc func buttonTapped() {
    guard let expenseText = textField.text, !expenseText.isEmpty else {
      // 빈 입력일 경우 메시지를 배열에 추가
      expenses.append("정확히 숫자를 입력해주세요")
      tableView.reloadData()
      textField.text = ""
      return
    }
    
    // 입력값이 숫자로 변환 가능한지 확인
    if let number = Double(expenseText.replacingOccurrences(of: ",", with: "")) {
      // 입력값이 숫자일 경우
      let formatter = NumberFormatter()
      formatter.numberStyle = .decimal
      if let formattedNumber = formatter.string(from: NSNumber(value: number)) {
        expenses.append(formattedNumber)
      }
    } else {
      expenses.append("정확한 숫자를 입력해주세요")
    }
    
    tableView.reloadData()
    textField.text = ""
  }
}

// UITableViewDataSource
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return expenses.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as? ExpenseCell else {
      return UITableViewCell()
    }
    let expenseText = expenses[indexPath.row]
    cell.configure(with: expenseText)
    return cell
  }
}

// Custom UITableViewCell
class ResultTableViewCell: UITableViewCell {
  
  let expenseLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    expenseLabel.font = .systemFont(ofSize: 16)
    expenseLabel.textColor = .black
    contentView.addSubview(expenseLabel)
    
    expenseLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      expenseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
      expenseLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with expense: String) {
    expenseLabel.text = expense
  }
}

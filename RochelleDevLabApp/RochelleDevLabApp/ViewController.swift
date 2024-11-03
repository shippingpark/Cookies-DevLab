//
//  ViewController.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 10/30/24.
//

import UIKit

class ViewController: UIViewController, ExpenseCellDelegate, UITableViewDelegate {
  
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
    
    setupContainerView() // 컨테이너 뷰 설정
    setupTableView() // 테이블 뷰 설정
    setupButtonAction() // 버튼 액션 설정
    
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
    tableView.delegate = self
    
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
    tableView.separatorStyle = .none
  }
  
  func setupButtonAction() {
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  }
  
  @objc func buttonTapped() {
    guard let expenseText = textField.text, !expenseText.isEmpty else {
      // 빈 입력일 경우 메시지를 배열에 추가
      expenses.insert("정확한 숫자를 입력해주세요", at: 0)
      tableView.reloadData()
      textField.text = ""
      textField.resignFirstResponder() // 키패드 내리기
      adjustTableViewInsets() // 테이블 뷰 여백 조정
      return
    }
    
    // 입력값이 숫자로 변환 가능한지 확인
    if let number = Double(expenseText.replacingOccurrences(of: ",", with: "")) {
      // 입력값이 숫자일 경우
      let formatter = NumberFormatter()
      formatter.numberStyle = .decimal
      if let formattedNumber = formatter.string(from: NSNumber(value: number)) {
        expenses.insert(formattedNumber, at: 0)
      }
    }
    
    tableView.reloadData()
    textField.text = ""
    textField.resignFirstResponder()
    adjustTableViewInsets()
  }
  
  func didTapDeleteButton(on cell: ExpenseCell) {
    guard let indexPath = tableView.indexPath(for: cell) else { return }
    expenses.remove(at: indexPath.row) // 배열에서 데이터 삭제
    tableView.deleteRows(at: [indexPath], with: .automatic) // 테이블 뷰에서 삭제
    
    adjustTableViewInsets()
  }
  
  
  // 테이블 뷰의 인셋을 조정하는 메서드
  private func adjustTableViewInsets() {
    let totalHeight = tableView.contentSize.height // TableView 내부 Cell들의 높이 합
    let visibleHeight = tableView.bounds.size.height // TableView 자체 높이
    
    // Cell들의 합이 전체 높이보다 작은 경우, 상단의 여백을 설정
    let inset = max(0, visibleHeight - totalHeight)
    tableView.contentInset = UIEdgeInsets(top: inset, left: 0, bottom: 0, right: 0) // 상단 여백 설정
  }
}

// UITableViewDataSource
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return expenses.count // 배열의 개수 반환
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as? ExpenseCell else {
      return UITableViewCell()
    }
    let expenseText = expenses[indexPath.row] // 순서대로 설정
    cell.delegate = self
    cell.configure(with: expenseText)
    return cell
  }
}

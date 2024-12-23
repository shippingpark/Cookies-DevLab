//
//  ViewController.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 10/30/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController, ExpenseCellDelegate, UITableViewDelegate {
  
  // UI 요소 정의
  let containerView = UIView()
  let textField = UITextField()
  let button = UIButton(type: .system)
  let tableView = UITableView()
  
  // 데이터를 저장할 배열
  var expenses: [String] = []
  var viewModel = ExpenseViewModel() // ViewModel 인스턴스 생성
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    setupContainerView()
    setupTableView()
    setupButtonAction()
    
    // ExpenseCell을 셀로 등록
    tableView.register(ExpenseCell.self, forCellReuseIdentifier: "ExpenseCell")
    addSwiftUIView()
  }
  
  // SwiftUI 뷰를 UIKit에 포함
  func addSwiftUIView() {
    let swiftUIView = SwiftUIView(viewModel: viewModel)
    let hostingController = UIHostingController(rootView: swiftUIView)  // UIHostingController를 생성하여 SwiftUI 뷰(MySwiftUIView)를 포함
    
    // HostingController를 컨테이너 뷰에 추가
    addChild(hostingController)  // UIHostingController를 현재 뷰 컨트롤러의 자식 뷰 컨트롤러로 추가
    view.addSubview(hostingController.view) // 현재 뷰 컨트롤러의 뷰에 UIHostingController의 뷰를 추가
    
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      hostingController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      hostingController.view.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
      hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
      hostingController.view.heightAnchor.constraint(equalToConstant: 50)
    ])
    
    // UIHostingController가 부모 뷰 컨트롤러로 이동했음을 알림
    hostingController.didMove(toParent: self)
    
    // 접근성 활성화
    hostingController.view.isAccessibilityElement = true
    hostingController.view.accessibilityLabel = "최근 지출 정보"
    hostingController.view.accessibilityTraits = .updatesFrequently
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
    
    // 다이나믹 폰트 적용
    let textFieldFont = UIFont.preferredFont(forTextStyle: .body)
    textField.font = UIFontMetrics.default.scaledFont(for: textFieldFont)
    textField.adjustsFontForContentSizeCategory = true
    
    // Button 설정
    button.setTitle("지출", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 15
    
    // 다이나믹 폰트 적용
    let buttonFont = UIFont.preferredFont(forTextStyle: .body)
    button.titleLabel?.font = UIFontMetrics.default.scaledFont(for: buttonFont)
    button.titleLabel?.adjustsFontForContentSizeCategory = true
    
    // Content Hugging Priority 설정
    textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
    button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    
    // Compression Resistance Priority 설정
    textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    button.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    
    // StackView에 TextField, Button 추가
    stackView.addArrangedSubview(textField)
    stackView.addArrangedSubview(button)
    
    // 버튼에 최소 너비 제약 추가
    button.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
    
    // TextField 너비 비율 조정
    textField.widthAnchor.constraint(greaterThanOrEqualTo: stackView.widthAnchor, multiplier: 0.6).isActive = true
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
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
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
      textField.text = ""
      textField.resignFirstResponder() // 키패드 내리기
      adjustTableViewInsets() // 테이블 뷰 여백 조정
      tableView.reloadData()
      return
    }
    
    // 입력값이 숫자로 변환 가능한지 확인
    if let number = Double(expenseText.replacingOccurrences(of: ",", with: "")) {
      // 입력값이 숫자일 경우
      let formatter = NumberFormatter()
      formatter.numberStyle = .decimal
      if let formattedNumber = formatter.string(from: NSNumber(value: number)) {
        viewModel.addExpense(formattedNumber)
        expenses.insert(formattedNumber, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0) // 첫 번째 셀에 추가
        tableView.insertRows(at: [indexPath], with: .none)
      }
    }
    
    textField.text = ""
    textField.resignFirstResponder()
    adjustTableViewInsets()
    
    tableView.reloadData()
  }
  
  func didTapDeleteButton(on cell: ExpenseCell) {
    guard let indexPath = tableView.indexPath(for: cell) else { return }
    expenses.remove(at: indexPath.row) // 배열에서 데이터 삭제
    tableView.deleteRows(at: [indexPath], with: .none) // 테이블 뷰에서 삭제
    adjustTableViewInsets() // 인셋 조정 호출
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
    
    // 다이나믹 폰트 적용
    let expenseFont = UIFont.preferredFont(forTextStyle: .body)
    cell.expenseLabel.font = UIFontMetrics.default.scaledFont(for: expenseFont)
    cell.expenseLabel.adjustsFontForContentSizeCategory = true
    
    return cell
  }
}

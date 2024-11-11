//
//  ViewController.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 10/30/24.
//

import UIKit
import SwiftUI

// 프로토콜 ? 자격증
// self ? 나 자신
// class - UIKit 자아가 있는 타입
// struct: 불변, 통일 X
// class: 하나의 identity
// 재사용 ? 컨베이어벨트 - 문법이 아님


class ViewController: UIViewController {
    
    
    // Day5 시작
    
    // 다이나믹폰트 관찰
   


    // ViewController에 TableView 추가
    private let tableView = UITableView()
    
    // 테이블뷰의 데이터를 표시하기 위한 배열 - dataList
    var spendArray: [String] = []
    
    // 지출 금액을 입력하는 텍스트뷰
    private lazy var spendTextFieldView: UIView =  {
        let view = UIView()
        
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 28
        view.layer.masksToBounds = true
        
        // spendTextFieldView에 텍스트필드, 버튼 올리기
        view.addSubview(spendTextField)
        view.addSubview(spendButton)
        
        // vocieOver 적용막기
        view.isAccessibilityElement = false
        
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
        
        // 다이나믹 폰트 적용
        tf.adjustsFontForContentSizeCategory = true
        tf.font = UIFont.preferredFont(forTextStyle: .body)
        
        // vocieOver 적용하기
        tf.accessibilityLabel = "지출 금액을 입력해주세요"

        
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
        button.addTarget(self, action: #selector(spendButtonTapped), for: .touchUpInside)
        
        // 다이나믹 폰트 적용
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
        // vocieOver 적용하기
        button.accessibilityLabel = "지출 버튼"
        button.accessibilityHint = "지출 버튼을 누릅니다"
        
        
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SwiftUI 화면
        let vc = UIHostingController(rootView: SwiftUIView())
        
        let swiftUiView = vc.view!
        swiftUiView.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(vc)
        view.addSubview(swiftUiView)
      
        NSLayoutConstraint.activate([
            swiftUiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftUiView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
        
       
        vc.didMove(toParent: self)
        
        // 테이블뷰 선 삭제
        tableView.separatorStyle = .none
        
        makeUI()
        setupTableView()
        setupTableViewConstraints()
    }
    
    
    
    
    func makeUI () {
        
        //spendTextFieldView를 view에 올리기
        view.addSubview(spendTextFieldView)
        
        //오토레이아웃 설정
        spendTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        
        spendTextField.translatesAutoresizingMaskIntoConstraints = false
        spendButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
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
    func setupTableView() {
        
        tableView.backgroundColor = .clear
        
        // 델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        
        // 셀의 높이 설정
        tableView.rowHeight = 61
        
        // 셀의 등록과정⭐️⭐️⭐️ (스토리보드 사용시에는 스토리보드에서 자동등록)
        tableView.register(SpendTableViewCell.self, forCellReuseIdentifier: "SpendCell")
    }
    
    func setupTableViewConstraints() {
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: spendTextFieldView.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    // 셀이 아래부터 쌓이도록 설정
    private func setSpendBlockFromBottom() {
        let totalHeight = tableView.contentSize.height // TableView 내부 Cell들의 높이 합
        let visibleHeight = tableView.bounds.size.height // TableView 자체 높이
        
        // Cell들의 합이 전체 높이보다 작은 경우,
        // (전체 - Cell들의 합)을 상단의 여백으로 둔다!!
        let inset = max(0, visibleHeight - totalHeight)
        tableView.contentInset = UIEdgeInsets(top: inset, left: 0, bottom: 0, right: 0)
        
      
    }
    
    @objc func spendButtonTapped() {
        // cell의 spendOutputLabel에 표시
        guard let spendText = spendTextField.text, !spendText.isEmpty else { return }
        
        spendArray.insert(spendText, at: 0)
        
        // 빈 텍스트배열
        spendTextField.text = ""
        
        tableView.reloadData()
        setSpendBlockFromBottom()
        
    }
    
    // 다이나믹 폰트 적용
//    @objc private func handleDynamicTypeChange() {
//        
//        spendTextField.font = UIFont.preferredFont(forTextStyle: .body)
//    }
}

extension ViewController: UITableViewDataSource {
    
    // 1) 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return spendArray.count
    }
    
    // 2) 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "SpendCell", for: indexPath)
    //        cell.textLabel?.text = spendArray[indexPath.row]
    //
    //
    //        return cell
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpendCell", for: indexPath) as? SpendTableViewCell else {
            return UITableViewCell()
        }
        
        // 델리게이트 설정
        cell.delegate = self
        
        // 셀의 텍스트 설정
        cell.spendOutputLabel.text = spendArray[indexPath.row]
        
        // 선택했을 때 회색으로 변하지 않게 설정
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
        
    }
    
}

extension ViewController: SpendTableViewCellDelegate {
    
    func didTapDeleteButton(in cell: SpendTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        spendArray.remove(at: indexPath.row) // Remove the item from the array
        tableView.deleteRows(at: [indexPath], with: .automatic) // Remove the cell from the table view
        self.setSpendBlockFromBottom()
        
    }
}


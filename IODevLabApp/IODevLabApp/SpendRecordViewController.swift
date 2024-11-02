//
//  SpendRecordViewController.swift
//  IODevLabApp
//
//  Created by Anjin on 11/1/24.
//

import UIKit

class SpendRecordViewController: UIViewController {
    private let spendInputView = UIView().set {
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let spendTextField = UITextField().set {
        $0.placeholder = "지출할 금액을 입력해!!"
        $0.backgroundColor = .clear
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        $0.keyboardType = .numberPad
    }
    
    private let spendButton = UIButton().set {
        $0.setTitle("지출", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 16
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let errorMessageLabel = UILabel().set {
        $0.text = "error"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var spendRecordTableView = UITableView().set {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        
        $0.register(SpendRecordTableViewCell.self, forCellReuseIdentifier: SpendRecordTableViewCell.identifier)
    }
    
    private var spendRecords: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
        setButtonAction()
        
        spendRecordTableView.delegate = self
        spendRecordTableView.dataSource = self
        
        // 키보드 '완료' 버튼 툴바에 추가
        spendTextField.delegate = self
        addDoneButtonOnKeyboard()
    }
    
    private func setButtonAction() {
        spendButton.addTarget(self, action: #selector(spendButtonTapped), for: .touchUpInside)
    }
    
    @objc private func spendButtonTapped() {
        if let spendTextFieldText = spendTextField.text, spendTextFieldText.isEmpty == false {
            // 텍스트필드가 비어있지 않을 때 동작
            formatSpendValue(spendTextFieldText)
            
            // 지출 텍스트필드의 값을 지워준다
            spendTextField.text = ""
            
        } else {
            // 텍스트필드가 비어있을 때 - 레이블에 숫자를 입력 후에 누르라는 메시지 전달
            errorMessageLabel.text = "숫자를 입력해주세유~~"
        }
    }
    
    // 셀이 아래부터 쌓이도록 설정
    private func setSpendBlockFromBottom() {
        let totalHeight = spendRecordTableView.contentSize.height // TableView 내부 Cell들의 높이 합
        let visibleHeight = spendRecordTableView.bounds.size.height // TableView 자체 높이
        
        // Cell들의 합이 전체 높이보다 작은 경우,
        // (전체 - Cell들의 합)을 상단의 여백으로 둔다!!
        let inset = max(0, visibleHeight - totalHeight)
        spendRecordTableView.contentInset = UIEdgeInsets(top: inset, left: 0, bottom: 0, right: 0)
    }
    
    private func formatSpendValue(_ spendTextFieldText: String) {
        if let spendValue = Int(spendTextFieldText) {
            // TextField의 값이 숫자인 경우
            // 숫자 format 형식 지정
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let formattedNumber = numberFormatter.string(from: spendValue as NSNumber) ?? ""
            
            // format된 지출 텍스트필드의 값을 지출 레이블로 가져온다
            spendRecords.insert(formattedNumber, at: 0)
            spendRecordTableView.reloadData()
            setSpendBlockFromBottom()
            
            // TODO: 음.. 지출버튼이 눌리고 나서 키보드가 내려가야할까..?
            
        } else {
            // TextField의 값이 숫자가 아닌 경우
            errorMessageLabel.text = "숫자만 입력하세유~~"
        }
    }
}

extension SpendRecordViewController {
    private func layout() {
        layoutSpendInputView()
        layoutErrorMessageLabel()
        layoutSpendRecordTableView()
    }
    
    private func layoutSpendInputView() {
        view.addSubview(spendInputView)
        NSLayoutConstraint.activate([
            spendInputView.heightAnchor.constraint(equalToConstant: 40),
            spendInputView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            spendInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            spendInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
        
        spendInputView.addSubview(spendTextField)
        NSLayoutConstraint.activate([
            spendTextField.centerYAnchor.constraint(equalTo: spendInputView.centerYAnchor),
            spendTextField.leadingAnchor.constraint(equalTo: spendInputView.leadingAnchor, constant: 12)
        ])
        
        spendInputView.addSubview(spendButton)
        NSLayoutConstraint.activate([
            spendButton.widthAnchor.constraint(equalTo: spendInputView.widthAnchor, multiplier: 0.15),
            spendButton.centerYAnchor.constraint(equalTo: spendInputView.centerYAnchor),
            spendButton.trailingAnchor.constraint(equalTo: spendInputView.trailingAnchor, constant: -12)
        ])
    }
    
    private func layoutErrorMessageLabel() {
        view.addSubview(errorMessageLabel)
        NSLayoutConstraint.activate([
            errorMessageLabel.heightAnchor.constraint(equalToConstant: 16),
            errorMessageLabel.topAnchor.constraint(equalTo: spendInputView.bottomAnchor, constant: 8),
            errorMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
    }
    
    private func layoutSpendRecordTableView() {
        view.addSubview(spendRecordTableView)
        NSLayoutConstraint.activate([
            spendRecordTableView.topAnchor.constraint(equalTo: errorMessageLabel.bottomAnchor, constant: 20),
            spendRecordTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            spendRecordTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            spendRecordTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// TableView 설정
extension SpendRecordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spendRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SpendRecordTableViewCell.identifier, 
                                                       for: indexPath) as? SpendRecordTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setSpendLabelText(spendRecords[indexPath.row])
        
//        cell.deleteAction = {
//            self.spendRecords.remove(at: indexPath.row)
//            tableView.reloadData()
//        }
        
        return cell
    }
}

// 키보드에 완료 버튼 추가
extension SpendRecordViewController: UITextFieldDelegate {
    func addDoneButtonOnKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // "완료" 버튼을 Toolbar에 추가
        let doneButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(doneButtonAction))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [flexibleSpace, doneButton] // 버튼을 오른쪽 정렬
        self.spendTextField.inputAccessoryView = toolbar // 텍스트 필드의 inputAccessoryView로 설정
    }
    
    @objc func doneButtonAction() {
        // "완료" 버튼을 눌렀을 때 키보드 내리기
        self.spendTextField.resignFirstResponder()
    }
}

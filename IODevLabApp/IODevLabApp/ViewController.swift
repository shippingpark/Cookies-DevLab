//
//  ViewController.swift
//  IODevLabApp
//
//  Created by Anjin on 10/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var spendInputView: UIView! // 지출 TextField + 지출 버튼
    @IBOutlet weak var spendTextField: UITextField! // 텍스트필드
    @IBOutlet weak var spendButton: UIButton! // 지출 버튼
    
    @IBOutlet weak var errorMessageLabel: UILabel! // 에러 메시지 레이블
    
    @IBOutlet weak var spendTableView: UITableView! // 지출 목록 TableView
    
    private var spendRecords: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spendTableView.dataSource = self
        spendTableView.delegate = self
        
        // 지출 텍스트필드와 값 View radius 지정
        spendInputView.layer.cornerRadius = 20
        
        // 지출 버튼 radius 지정
        spendButton.layer.cornerRadius = 16
        
        // TableView 구분선 삭제
        spendTableView.separatorStyle = .none
    }
    
    }
    
    // 지출 버튼 action
    @IBAction func spend(_ sender: UIButton) {
        // 텍스트필드가 비어있지 않을 때 동작
        if let spendTextFieldText = spendTextField.text, spendTextFieldText.isEmpty == false {
            
            // TextField의 값이 숫자인 경우
            if let spendValue = Int(spendTextFieldText) {
                // 숫자 format 형식 지정
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                
                // format된 지출 텍스트필드의 값을 지출 레이블로 가져온다
                //                spendRecords.append(numberFormatter.string(from: spendValue as NSNumber) ?? "")
                spendRecords.insert(numberFormatter.string(from: spendValue as NSNumber) ?? "", at: 0)
                spendTableView.reloadData()
                
                // 새로운 셀이 추가될 때마다 테이블 뷰가 아래로 스크롤되도록 설정
                
            } else { // TextField의 값이 숫자가 아닌 경우
                errorMessageLabel.text = "숫자만 입력하세유~~"
            }
            
            // 지출 텍스트필드의 값을 지워준다
            spendTextField.text = ""
            
        } else { // 텍스트필드가 비어있을 때 동작
            
            // 레이블에 숫자를 입력 후에 누르라는 메시지 전달
            errorMessageLabel.text = "숫자를 입력해주세유~~"
            
        }
    }
    
    // TextField 입력 길이 제한
    @IBAction func editingChangedSpendTextField(_ sender: UITextField) {
        guard let spendTextFieldText = sender.text else { return }
        
        if spendTextFieldText.count > 15 {
            sender.deleteBackward()
            
            errorMessageLabel.text = "15자리까지 입력할 수 있어유~~"
        } else {
            errorMessageLabel.text = ""
        }
    }
}

// TableView 설정
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spendRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpendTableViewCell", for: indexPath) as? SpendTableViewCell else {
            return UITableViewCell()
        }
        
        cell.spendValueLabel.text = spendRecords[indexPath.row]
        cell.deleteAction = {
            self.spendRecords.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        return cell
    }
}

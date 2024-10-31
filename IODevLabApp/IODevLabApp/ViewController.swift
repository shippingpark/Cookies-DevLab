//
//  ViewController.swift
//  IODevLabApp
//
//  Created by Anjin on 10/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var spendInputView: UIView! // 지출 TextField + 지출 버튼
    // TODO: 텍스트필드에서 입력할 때도 숫자 형식 변환
    @IBOutlet weak var spendTextField: UITextField! // 텍스트필드
    @IBOutlet weak var spendButton: UIButton! // 지출 버튼
    
    @IBOutlet weak var spendLabelView: UIView! // 지출한 값 + "원"
    @IBOutlet weak var spendLabel: UILabel! // 지출한 값
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 지출 텍스트필드와 값 View radius 지정
        spendInputView.layer.cornerRadius = 20
        spendLabelView.layer.cornerRadius = 20
        
        // 지출 버튼 radius 지정
        spendButton.layer.cornerRadius = 16
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
                spendLabel.text = numberFormatter.string(from: spendValue as NSNumber)
                
            } else { // TextField의 값이 숫자가 아닌 경우
                // TODO: 숫자가 아님을 경고할 때 텍스트 색상도 변경해보자
                spendLabel.text = "숫자만 입력하세유~~"
            }
            
            // 지출 텍스트필드의 값을 지워준다
            spendTextField.text = ""
            
        } else { // 텍스트필드가 비어있을 때 동작
            
            // 레이블에 숫자를 입력 후에 누르라는 메시지 전달
            spendLabel.text = "금액을 입력하고 지출해~~"
            
        }
    }
}

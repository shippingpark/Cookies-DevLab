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
        print("spend")
        // 지출 텍스트필드의 값을 지출 레이블로 가져온다
        spendLabel.text = spendTextField.text
        
        // 지출 텍스트필드의 값을 지워준다
        spendTextField.text = ""
    }
}


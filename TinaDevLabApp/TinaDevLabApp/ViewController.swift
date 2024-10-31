//
//  ViewController.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 10/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    // 1) 텍스트 필드에 숫자 입력하기
// 2) 지출 버튼 누르기
// 3) 입력된 숫자가 라벨에 표시되기
// 4) 텍스트 필드 숫자 없어지기
    // 변수는 컴포넌트명
    
    
    @IBOutlet weak var spendTextField: UITextField!
    @IBOutlet weak var spendTextView: UIView!
    @IBOutlet weak var spendOutputLabel: UILabel!
    @IBOutlet weak var spendOutputView: UIView!
    @IBOutlet weak var spendTappedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 지출 텍스트필드와 값 view radius 지정
        spendTextView.layer.cornerRadius = 20
        
        spendTappedButton.layer.cornerRadius = 15
        
        spendOutputView.layer.cornerRadius = 20
        
    }
    
   
    // 지출 입력 버튼
    // 함수는 동사형 시작
    @IBAction func spendTapped(_ sender: UIButton) {
        // 3) 입력된 숫자가 라벨에 표시되기
        spendOutputLabel.text = spendTextField.text
    }

    
}


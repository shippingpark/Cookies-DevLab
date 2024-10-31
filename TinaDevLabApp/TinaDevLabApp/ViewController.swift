//
//  ViewController.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 10/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    // 텍스트 필드
    @IBOutlet weak var expenseInput: UITextField!

    // 숫자 나오는 곳
    @IBOutlet weak var expenseOutput: UILabel!
    
    @IBOutlet weak var labelWon: UILabel!
    
    
    // 1) 텍스트 필드에 숫자 입력하기
    // 2) 지출 버튼 누르기
    // 3) 입력된 숫자가 라벨에 표시되기
    // 4) 텍스트 필드 숫자 없어지기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    // 지출 입력 버튼
    @IBAction func expenseTapped(_ sender: UIButton) {
       
        // 3) 입력된 숫자가 라벨에 표시되기
        expenseOutput.text = expenseInput.text
        
        
        

       
    }
    
}


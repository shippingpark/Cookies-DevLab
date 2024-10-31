//
//  ViewController.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 10/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expenseInput: UITextField!
    
    @IBOutlet weak var labelExpenseOutput: UILabel!
    @IBOutlet weak var labelWon: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    // 지출 입력 버튼
    @IBAction func expenseTapped(_ sender: UIButton) {
        labelExpenseOutput.text = expenseInput.text!
    }
    
}


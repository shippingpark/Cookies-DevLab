//
//  ViewController.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 10/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expenseInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        expenseInput.keyboardType = UIKeyboardType.numberPad
    }

    @IBAction func expenseTapped(_ sender: UIButton) {
    }
    
}


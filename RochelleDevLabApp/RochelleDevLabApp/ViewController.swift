//
//  ViewController.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 10/30/24.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  
  @IBOutlet weak var afterButtonPressed: UIView!
  
  @IBOutlet weak var resultLabel: UILabel!
  
  @IBOutlet weak var resultLabelUnit: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    afterButtonPressed.isHidden = true
  }
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    
    afterButtonPressed.isHidden = false
    
    
    if textField.text?.isEmpty == false {
      let number = Int(textField.text!) ?? 0
      
      let numberFormatter = NumberFormatter()
      numberFormatter.numberStyle = .decimal
      
      resultLabel.text = numberFormatter.string(from: NSNumber(value: number))
    } else {
      resultLabel.text = "숫자를 입력하세요"
    }
  }
}

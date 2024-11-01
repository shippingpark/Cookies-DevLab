//
//  ViewController.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 10/30/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var afterButtonPressed: UIView!
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var resultLabelUnit: UILabel!
  @IBOutlet weak var resultLabelDelete: UIButton!
  @IBOutlet weak var tableView: UITableView!
  
  // 데이터 배열 생성
   var spendRecords: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    afterButtonPressed.isHidden = true
    resultLabelDelete.isHidden = true
    resultLabel.isHidden = true
    resultLabelUnit.isHidden = true
    
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultCell")
  }
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    // 키보드를 내리기 위해 textField의 포커스를 해제
    textField.resignFirstResponder()
    
    // afterButtonPressed를 보이게 함
    afterButtonPressed.isHidden = false
    
    // textField의 텍스트를 가져와서 쉼표가 찍히도록 숫자 형식으로 변환
    if let text = textField.text, let number = Int(text) {
      let numberFormatter = NumberFormatter()
      numberFormatter.numberStyle = .decimal
      resultLabel.text = numberFormatter.string(from: NSNumber(value: number))
      
      
      resultLabel.isHidden = false // 결과 레이블을 보이게 함
      resultLabelUnit.isHidden = false // 단위 레이블을 보이게 함
      resultLabelDelete.isHidden = false // 삭제 버튼을 보이게 함
    } else {
      resultLabel.text = "유효한 숫자를 입력해주세요"
      resultLabel.isHidden = false // 결과 레이블을 보이게 함
      resultLabelUnit.isHidden = false // 단위 레이블을 보이게 함
      resultLabelDelete.isHidden = false // 삭제 버튼을 보이게 함
    }
  }
  
  @IBAction func resultLabelDeleteButtonPressed(_ sender: UIButton) {
    // 모든 UI 요소 숨기기
    resultLabelDelete.isHidden = true
    resultLabel.isHidden = true
    resultLabelUnit.isHidden = true
    afterButtonPressed.isHidden = true
  }
  
  // TableView 설정
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return spendRecords.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? ResultTableViewCell else {
       return UITableViewCell()
     }
     
     // 배열에서 현재 행의 데이터를 가져와 셀에 설정
     cell.resultLabel.text = spendRecords[indexPath.row]
     cell.resultLabelUnit.text = "원" // 단위 설정
     

     return cell
   }
}


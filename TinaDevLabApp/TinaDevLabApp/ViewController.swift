//
//  ViewController.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 10/30/24.
//

import UIKit

// 프로토콜 ? 자격증
// self ? 나 자신
// class - UIKit 자아가 있는 타입
// struct: 불변, 통일 X
// class: 하나의 identity
// 재사용 ? 컨베이어벨트 - 문법이 아님


class ViewController: UIViewController {
    
    @IBOutlet weak var spendTextField: UITextField!
    @IBOutlet weak var spendTextView: UIView!
    @IBOutlet weak var spendTappedButton: UIButton!
    
    
    @IBOutlet weak var table: UITableView!
    let cellName: String = "customeCell"
    var cellTitle: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 지출 텍스트필드와 값 view radius 지정
        spendTextView.layer.cornerRadius = 20
        spendTappedButton.layer.cornerRadius = 15
        
        table.delegate = self
        // 없으면, 눌렀는데 동작을 안해
        // 이 시점에 이 method
        // 시점에 필요한 method
        // head는 있고 구체적인 내용은 없음
        
        table.dataSource = self
        // 없으면, 화면이 안 보여
        //viewController가 인스턴스?
        //프로토콜 = 자격증 채택개념
        //table뷰가 nil값을 들고 있음
        //dataSource라는 타입
        //깡통인 cell 안에 타입을 넣어주려 함
        
    }
    
    // 지출 입력 버튼
    @IBAction func spendTapped(_ sender: UIButton) {
        
        // GPT 코드
        // 1. spendTextField에 입력된 텍스트 가져오기
        guard let text = spendTextField.text, !text.isEmpty else {
            return  // 텍스트가 없으면 아무 작업도 하지 않음
        }
        
        // 2. 입력된 숫자를 배열에 추가
        cellTitle.insert(text, at: 0)  // 위쪽에서부터 숫자가 입력되도록 배열 앞에 추가
        
        // 3. 테이블 뷰를 리로드하여 업데이트
        table.reloadData()
        
        // 4. 텍스트 필드 초기화
        spendTextField.text = ""
        
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customeCell = table.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomeCell
        
        customeCell.spendOutputLabel.text = cellTitle[indexPath.row]
//        customeCell.spendOutputLabel.text = spendTextField.text
        return customeCell
        
    }
}


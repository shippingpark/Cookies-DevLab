//
//  ViewController.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 10/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var spendTextField: UITextField!
    @IBOutlet weak var spendTextView: UIView!
    @IBOutlet weak var spendTappedButton: UIButton!
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 지출 텍스트필드와 값 view radius 지정
        spendTextView.layer.cornerRadius = 20
        spendTappedButton.layer.cornerRadius = 15
        

                
    }
    
   
    // 지출 입력 버튼
    // 함수는 동사형 시작
    @IBAction func spendTapped(_ sender: UIButton) {
        // 3) 입력된 숫자가 라벨에 표시되기
    }

    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}


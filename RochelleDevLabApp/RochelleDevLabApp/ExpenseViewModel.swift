//
//  ExpenseViewModel.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 11/4/24.
//

import SwiftUI
import Combine

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [String] = []
    
    // 최신 지출 금액을 저장
    var latestExpense: String {
        expenses.first ?? "0"
    }
    
    func addExpense(_ expense: String) {
        expenses.insert(expense, at: 0)
    }
    
    func removeExpense(at index: Int) {
        expenses.remove(at: index)
    }
}

//
//  SwiftUIView.swift
//  RochelleDevLabApp
//
//  Created by 이연정 on 11/3/24.
//

import SwiftUI

struct SwiftUIView: View {
  @ObservedObject var viewModel: ExpenseViewModel
  
  var body: some View {
    HStack(spacing: 10) {
      Text(viewModel.latestExpense)
        .font(.body)
        .foregroundColor(.primary)
    }
    .padding()
    .frame(minWidth: 343, maxWidth: .infinity, maxHeight: 50)
    .background(Color(UIColor.systemGray6))
    .clipShape(RoundedRectangle(cornerRadius: 999))
    .accessibilityElement(children: .ignore)
    .accessibilityLabel("최근 지출")
    .accessibilityValue(viewModel.latestExpense)
    .accessibilityHint("가장 최근에 추가된 지출 금액입니다")
  }
}

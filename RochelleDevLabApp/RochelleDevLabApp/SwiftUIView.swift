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
    .frame(minWidth: 343)
    .background(Color(UIColor.systemGray6))
    .clipShape(RoundedRectangle(cornerRadius: 999)) // 매우 큰 값으로 모서리를 둥글게
  }
}

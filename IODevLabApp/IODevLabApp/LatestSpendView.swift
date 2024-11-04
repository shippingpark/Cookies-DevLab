//
//  LatestSpendView.swift
//  IODevLabApp
//
//  Created by Anjin on 11/2/24.
//

import SwiftUI

@Observable
class SpendData {
    var latestSpendValue: String = ""
}

struct LatestSpendView: View {
    var spendData: SpendData
    
    var body: some View {
        HStack {
            Spacer()
            Text("나 최근 입력 값 -> \(spendData.latestSpendValue)")
                .font(.body)
            Spacer()
        }
        .padding(.vertical, 12)
        .background(Color(uiColor: UIColor.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

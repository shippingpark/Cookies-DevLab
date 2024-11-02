//
//  LatestSpendView.swift
//  IODevLabApp
//
//  Created by Anjin on 11/2/24.
//

import SwiftUI

struct LatestSpendView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("나 최근 입력 값")
                .font(.system(size: 14))
                .padding(.vertical, 8)
            Spacer()
        }
        .frame(height: 40)
        .background(Color(uiColor: UIColor.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    LatestSpendView()
}

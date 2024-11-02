//
//  SwiftUIView.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 11/3/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius:20).frame(width: 343, height: 50)
                    .foregroundStyle(.blue)
            }
    }
}

#Preview {
    SwiftUIView()
}

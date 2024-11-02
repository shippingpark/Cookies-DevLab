//
//  SwiftUIView.swift
//  TinaDevLabApp
//
//  Created by KIM SEOWOO on 11/3/24.
//

import SwiftUI
import UIKit

// SomeSwiftUIView를 호스팅해주는 UIHostingController
class HostingViewController: UIHostingController<SwiftUIView> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct SwiftUIView: View {
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius:25).frame(width: 343, height: 50)
                    .foregroundStyle(.blue)
                Text("금액 나오는 부분")
                    .foregroundStyle(.white)
            }
    }
}

#Preview {
    SwiftUIView()
}

//
//  ObjectSetter.swift
//  IODevLabApp
//
//  Created by Anjin on 11/2/24.
//

import UIKit

// set을 구현
// 이전에 사용해본 then 대신에 직접 구현
protocol ObjectSetter {}

extension ObjectSetter where Self: UIView {
    func set(_ configure: (Self) -> Void) -> Self {
        configure(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

extension NSObject: ObjectSetter {}

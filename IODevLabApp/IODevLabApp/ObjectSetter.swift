//
//  ObjectSetter.swift
//  IODevLabApp
//
//  Created by Anjin on 11/2/24.
//

import Foundation

// set을 구현
// 이전에 사용해본 then 대신에 직접 구현
protocol ObjectSetter {}

extension ObjectSetter where Self: AnyObject {
    func set(_ configure: (Self) -> Void) -> Self {
        configure(self)
        return self
    }
}

extension NSObject: ObjectSetter {}

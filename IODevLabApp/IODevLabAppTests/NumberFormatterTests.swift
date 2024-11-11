//
//  NumberFormatterTests.swift
//  IODevLabAppTests
//
//  Created by Anjin on 11/4/24.
//

import XCTest
@testable import IODevLabApp

final class AKNumberFormatterTests: XCTestCase {
    let formatter = AKNumberFormatter()
    
    // Test가 동작하는지
    func testTest() {
        XCTAssertEqual(1, 1)
    }
    
    // 세 자리 수까지는 그대로 - input: 0 -> return 0
    func test_whenInputIsZero_returnsZero() {
        XCTAssertEqual(formatter.formatWithCommas("0"), "0")
    }
    
    // 세 자리 수까지는 그대로 - input: 12 -> return 12
    func test_whenInputIsBelowThousand_returnsSameString() {
        XCTAssertEqual(formatter.formatWithCommas("12"), "12")
    }
    
    // 세 자리 수부터 ,가 찍히도록 - input: 1000 -> return 1,000
    func test_whenInputIsThousand_returnsFormattedString() {
        XCTAssertEqual(formatter.formatWithCommas("1000"), "1,000")
    }

    // 세 자리 수부터 ,가 찍히도록 - input: 1000000 -> return 1,000,000
    func test_whenInputIsMillion_returnsFormattedString() {
        XCTAssertEqual(formatter.formatWithCommas("1000000"), "1,000,000")
    }
    
    // 앞에 0이 포함되더라도 삭제 후 반환 - input: 00001234 -> return 1,234
    func tests_whenInputHasLeadingZeros_returnsFormattedStringWithoutLeadingZeros() {
        XCTAssertEqual(formatter.formatWithCommas("00001234"), "1,234")
    }
    
    // 글자 입력 시, nil 반환 - input: 가나다 -> return nil
    func test_whenInputIsNonNumeric_returnsNil() {
        XCTAssertNil(formatter.formatWithCommas("가나다"))
    }
    
    // Int 초과 시, nil 반환 - input: 12345678901234567890 -> return nil
    func test_whenInputExceedsIntLimit_returnsNil() {
        XCTAssertNil(formatter.formatWithCommas("12345678901234567890")) // Int 범위 초과
    }
    
    // Int의 최댓값에도 잘 반영 - input: 9223372036854775807 -> return 9,223,372,036,854,775,807
    func test_whenInputIsMaxIntValue_returnsFormattedMaxInt() {
        XCTAssertEqual(formatter.formatWithCommas("\(Int.max)"), "9,223,372,036,854,775,807")
    }
    
    // 소수점이 포함 시, nil 반환 - input: 1234.56 -> return nil
    func test_whenInputContainsDecimal_returnsNil() {
        XCTAssertNil(formatter.formatWithCommas("1234.56"))
    }
    
    // 빈 문자열 입력 시, nil 반환 - input: "" -> return nil
    func test_whenInputIsEmptyString_returnsNil() {
        XCTAssertNil(formatter.formatWithCommas(""))
    }
    
    // 공백이 포함된 문자열 입력 시, nil 반환 - input: " 1000 " -> return nil
    func test_whenInputContainsWhitespace_returnsNil() {
        XCTAssertNil(formatter.formatWithCommas(" 1000 "))
    }
    
    // 음수 입력 시, nil 반환 - input: -1000 -> return nil
    // 보통의 formatter라면 음수에 ,가 찍히겠지만, 우리는 금액이므로 양수만 처리
    func test_whenInputIsNegativeNumber_returnsFormattedNegative() {
        XCTAssertNil(formatter.formatWithCommas("-1000"))
    }
}

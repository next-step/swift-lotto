//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by 카카오VX on 2022/04/28.
//

import XCTest

class CalculatorTest: XCTestCase {
    func testUnsplitableExpresstion() {
        let inputExpresstion = "1,2:3"
        
        let splitExpresstion = inputExpresstion.components(separatedBy: ",:")
        
        XCTAssertTrue(splitExpresstion.count != 3)
    }
    
    func testSplitableExpresstion() {
        let inputExpresstion = "1,2:3"
        
        let convertedExpresstion = inputExpresstion.replacingOccurrences(of: ":", with: ",")
        let splitedExpresstion = convertedExpresstion.components(separatedBy: ":")
        
        XCTAssertTrue(splitedExpresstion.count != 3)
    }
    
    func testAddSplitedExpresstion() {
        let inputExpresstion = "1,2:3"
        let convertedExpresstion = inputExpresstion.replacingOccurrences(of: ":", with: ",")
        let splitedExpresstion = convertedExpresstion.components(separatedBy: ",").map { Int($0) }
        let result: Int = splitedExpresstion[0]! + splitedExpresstion[1]! + splitedExpresstion[2]!
        
        XCTAssertEqual(result, 6)
    }
    
    func testRuturn0WhenInputNil() {
        let input: String? = nil
        var result: Int = 0
        
        if input == nil { result = 0 }
        
        XCTAssertEqual(result, 0)
    }
    
    func testConvertSeparator() {
        let input: String = "4:5,6"
        let convertedSeparator = StringUtiltity.convertSeparator(to: input)
        
        XCTAssertEqual(convertedSeparator, "4,5,6")
    }
    
    func testSplitExpression() {
        let input: String = "4,5,6"
        let splitedExpression = StringUtiltity.splitExpression(to: input)
        
        XCTAssertEqual(splitedExpression, [4, 5, 6])
    }
    
    func testValidateContainsNagativeNumbers() {
        let target: [Int] = [4, -5, 6]
        XCTAssertThrowsError(try CalculatorInputChecker.validateContainsNagativeNumbers(to: target)) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.unSupportedNegativeNumber)
        }
    }
    
    func testAddOperand() {
        let target: [Int] = [4, 5, 6]
        let result: Int = Calculator.addOperand(target: target)
        
        XCTAssertEqual(result, 15)
    }
    
    func testCalculate() {
        let input: String = "4:5,6"
        XCTAssertNoThrow(try Calculator.calculate(to: input))
    }
}

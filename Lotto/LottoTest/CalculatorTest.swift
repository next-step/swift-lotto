//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by 카카오VX on 2022/04/28.
//

import XCTest

class CalculatorTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
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
}

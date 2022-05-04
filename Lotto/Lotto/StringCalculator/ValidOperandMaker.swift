//
//  ValidOperandMaker.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/04.
//

import Foundation

struct ValidOperandMaker {
    
    private enum ValidOperandMakerError: Error {
        case negative
        case notInt
    }
    
    private let stringConverter = StringConverter()
    
    func operand(from component: String) throws -> Int {
        let intComponent = try convertToInt(of: component)
        guard !isNegative(of: intComponent) else {
            throw ValidOperandMakerError.negative
        }
        return intComponent
    }
    
    private func convertToInt(of component: String) throws -> Int {
        do {
            let operand: Int = try stringConverter.convertToInt(from: component)
            return operand
        } catch {
            throw ValidOperandMakerError.notInt
        }
    }

    private func isNegative(of input: Int) -> Bool {
        let isNegativeInt = input < 0
        return isNegativeInt
    }
}


//
//  StringConverter.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/05.
//

import Foundation

struct StringConverter {
    enum StringConverterError: Error, UserInformable {
        
        case nilValue
        case convertToIntFail
        
        var guideDescription: String {
            switch self {
            case .nilValue:
                return "빈 값이 들어왔습니다"
            case .convertToIntFail:
                return "Int 로 변환에 실패했습니다. 정수를 입력해주세요"
            }
        }
    }
    
    func unwrapOptional(from input: String?) throws -> String {
        guard let input = input else {
            throw StringConverterError.nilValue
        }
        return input
    }
    
    func convertToInt(from input: String?) throws -> Int {
        let input = try unwrapOptional(from: input)
        guard let result = Int(input) else {
            throw StringConverterError.convertToIntFail
        }
        return result
    }
}

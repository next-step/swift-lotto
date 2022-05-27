//
//  InputView.swift
//  Lotto
//
//  Created by 김성준 on 2022/05/27.
//

import Foundation

enum InputError: Error {
    case unacceptableNumbers
}

struct InputView {
    func validation(_ receivedText: String?) -> Int {
        guard let input: String = receivedText,
              input.isEmpty == false else {
            return 0
        }
        return 1
    }
    
    func convertToIntegerArray(receivedText text: String) throws -> [Int] {
        if let number: Int = Int(text) {
            return [number]
        }
        
        let result = text.replacingOccurrences(of: ":", with: ",")
            .components(separatedBy: ",")
            .compactMap { Int($0) }
       
        guard result.filter({ $0 < 0 }).isEmpty else {
            throw InputError.unacceptableNumbers
        }
        
        return result
    }
}

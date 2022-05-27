//
//  InputView.swift
//  Lotto
//
//  Created by 김성준 on 2022/05/27.
//

import Foundation

struct InputView {
    func validation(_ receivedText: String?) -> Int {
        guard let input: String = receivedText,
              input.isEmpty == false else {
            return 0
        }
        return 1
    }
    
    func convertToIntegerArray(receivedText text: String) -> [Int] {
        if let number: Int = Int(text) {
            return [number]
        }
        
        return text.replacingOccurrences(of: ":", with: ",")
            .components(separatedBy: ",")
            .compactMap { Int($0) }
    }
}

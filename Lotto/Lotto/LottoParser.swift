//
//  LottoParser.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/10.
//

import Foundation

struct LottoParser {
    enum Error: LocalizedError {
        case nonNumber
        
        var errorDescription: String? {
            switch self {
            case .nonNumber: return "로또는 숫자를 갖습니다."
            }
        }
    }
    
    private static let sepearator = CharacterSet(charactersIn: ", ")
    
    static func parseLotto(_ lottoNumberInput: String?) throws -> AutoLotto {
        let lottoNumbers = try parseLottoNumbers(lottoNumberInput)
        return try AutoLotto(numbers: lottoNumbers)
    }
    
    static func parseWinningLotto(lottoNumberInput: String?, bonusNumberInput: String?) throws -> WinningLotto {
        let lottoNumbers = try parseLottoNumbers(lottoNumberInput)
        
        guard let bonusNumberInput = bonusNumberInput,
              let bonusNumber = Int(bonusNumberInput) else {
                  throw Error.nonNumber
              }

        return try WinningLotto(numbers: lottoNumbers, bonusNumber: bonusNumber)
    }
    
    static func parseCustomLotto(_ lottoInput: String?) throws -> CustomLotto {
        let lottoNumbers = try parseLottoNumbers(lottoInput)
        return try CustomLotto(numbers: lottoNumbers)
    }
    
    static func parseLottoNumbers(_ lottoNumberInput: String?) throws -> [Int] {
        guard let lottoInput = lottoNumberInput else { throw Error.nonNumber }

        let lottoNumbers = lottoInput.components(separatedBy: sepearator)
            .compactMap { Int($0) }
        
        return lottoNumbers
    }
}

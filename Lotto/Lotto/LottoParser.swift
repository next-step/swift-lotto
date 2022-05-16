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
    
    private static let sepearator = ", "
    
    static func parseLotto(_ lottoInput: String?) throws -> DefaultLotto {
        guard let lottoInput = lottoInput else { throw Error.nonNumber }

        let lottoNumbers = lottoInput.components(separatedBy: sepearator)
            .compactMap { Int($0) }
        return try DefaultLotto(numbers: lottoNumbers)
    }
}

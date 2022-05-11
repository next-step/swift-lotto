//
//  WinningStatisticsFormatter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/12.
//

import Foundation

struct WinningRecordFormatter {
    static func format(_ statistics: WinningRecord) -> String {
        
        return WinningPrize.allCases.reduce("") { partialResult, winningPrize in
            partialResult + "\(winningPrize.rawValue)개 일치(\(winningPrize.value))원 - \(statistics.value[winningPrize]!)개" + "\n"
        }
        
    }
}

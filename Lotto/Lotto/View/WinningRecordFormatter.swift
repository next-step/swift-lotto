//
//  WinningStatisticsFormatter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/12.
//

import Foundation

struct WinningRecordFormatter {
    static func format(_ statistics: WinningRecord) -> String {
        return WinningCount.allCases.reduce("") { partialResult, winningCount in
            partialResult + "\(winningCount.rawValue)개 일치(\(winningCount.prize))원 - \(statistics.value[winningCount]!)개 \n"
        }
    }
}

//
//  WinningStatisticsFormatter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/12.
//

import Foundation

struct WinningRecordFormatter {
    static func format(_ statistics: WinningRecord) -> String {
        return "3개 일치 (5000원)- \(statistics.value[.fifth]!)개 \n"
        + "4개 일치 (50000원)- \(statistics.value[.fourth]!)개 \n"
        + "5개 일치 (50000원)- \(statistics.value[.third]!)개 \n"
        + "5개 일치, 보너스 번호 일치(30000000원) - \(statistics.value[.second]!)개 \n"
        + "6개 일치 (50000원)- \(statistics.value[.first]!)개 \n"
    }
    
    
}

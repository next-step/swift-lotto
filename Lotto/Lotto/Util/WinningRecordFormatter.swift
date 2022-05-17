//
//  WinningStatisticsFormatter.swift
//  Lotto
//
//  Created by nylah.j on 2022/05/12.
//

import Foundation

struct WinningRecordFormatter {
    private static let newLine = "\n"
    private enum Text {
        static let fifth = "3개 일치 (5000원)- %d개"
        static let fourth = "4개 일치 (50000원)- %d개"
        static let third = "5개 일치 (50000원)- %d개"
        static let second = "5개 일치, 보너스 번호 일치(30000000원) - %d개"
        static let first = "6개 일치 (50000원)- %d개"
    }
    
    static func format(_ statistics: WinningRecord) -> String {
        return String(format: Text.fifth, statistics.value[.first]!) + newLine
                + String(format: Text.fourth, statistics.value[.fourth]!) + newLine
                + String(format: Text.third, statistics.value[.third]!) + newLine
                + String(format: Text.second, statistics.value[.second]!) + newLine
                + String(format: Text.first, statistics.value[.first]!)
    }
}

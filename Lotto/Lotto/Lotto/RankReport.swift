//
//  RankReport.swift
//  Lotto
//
//  Created by 카카오VX on 2022/05/01.
//

import Foundation

struct Report: Equatable {
    private(set) var first: Int
    private(set) var second: Int
    private(set) var third: Int
    private(set) var fourth: Int
    private(set) var fifth: Int
    
    mutating func update(rank: Rank) {
        switch rank {
        case .first: self.first += 1
        case .second: self.second += 1
        case .third: self.third += 1
        case .fourth: self.fourth += 1
        case .fifth: self.fifth += 1
        case .miss: break
        }
    }
}

struct RankReport {
    private let winning: [Rank]
    
    init(winning: [Rank]) {
        self.winning = winning
    }
    
    func report() -> Report {
        var report: Report = Report(first: 0, second: 0, third: 0, fourth: 0, fifth: 0)
        
        for rank in winning {
            report = reporting(rank: rank, report: report)
        }
        
        return report
    }
    
    private func reporting(rank: Rank, report: Report) -> Report {
        var updatedReport: Report = report
        
        updatedReport.update(rank: rank)
        
        return updatedReport
    }
}

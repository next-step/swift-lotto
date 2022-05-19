//
//  DescriptionText.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/14.
//

import Foundation

enum LottoInputGuide {
    case money
    case buyingLottoCount(Int)
    case winningNumbers
    case winningBonusNumber
    
    var description: String {
        switch self {
        case .money: return "구매금액을 입력해 주세요."
        case .buyingLottoCount(let count): return "\(count)개를 구매했습니다."
        case .winningNumbers: return "지난 주 당첨 번호를 입력해 주세요."
        case .winningBonusNumber: return "보너스 번호를 입력해 주세요."
        }
    }
    
    func show() {
        print(description)
    }
}


enum LottoStatisticGuide {
    case start
    case totalRewardRatio(String)
    case winningTypeRewardCount(type:Winning,count:Int)

    var description: String {
        switch self {
        case .start: return "당첨 통계\n---------"
        case .totalRewardRatio(let ratio): return "총 수익률을 \(ratio) 입니다"
        case .winningTypeRewardCount(let winning, let count):
            return "\(winning.description) \(winning.reward)원 - \(count)개"
        }
    }
    func show() {
        print(description)
    }
}

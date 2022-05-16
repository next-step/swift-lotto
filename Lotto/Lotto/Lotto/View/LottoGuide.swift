//
//  DescriptionText.swift
//  Lotto
//
//  Created by brian은석 on 2022/05/14.
//

import Foundation

enum LottoGuide {
    case inputMoneyText 
    case totalLotteyCountText(Int)
    case winningNumbersInputText
    case winningBonusNumberInputText
    case statisticStart
    case winningTypeRewardCount(type:Winning,count:Int)
    case totalRewardRatio(String)

    var description: String {
        switch self {
        case .inputMoneyText: return "구매금액을 입력해 주세요."
        case .totalLotteyCountText(let count): return "\(count)개를 구매했습니다."
        case .winningNumbersInputText: return "지난 주 당첨 번호를 입력해 주세요."
        case .winningBonusNumberInputText: return "보너스 번호를 입력해 주세요."
        case .statisticStart: return "당첨 통계\n---------"
        case .totalRewardRatio(let ratio): return "총 수익률을 \(ratio) 입니다"
        case .winningTypeRewardCount(let winning, let count):
            return "\(winning.description) \(winning.reward)원 - \(count)개"

        }
    }
    
    func show() {
        print(description)
    }
}

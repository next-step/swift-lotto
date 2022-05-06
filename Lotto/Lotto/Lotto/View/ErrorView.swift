//
//  ErrorView.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct ErrorView {
    
    private let userGuider = UserGuider()
    
    func guideInputError(error: UserInformable) {
        userGuider.guide(for: error)
    }
}

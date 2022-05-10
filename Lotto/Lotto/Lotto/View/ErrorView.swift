//
//  ErrorView.swift
//  Lotto
//
//  Created by 강수진 on 2022/05/07.
//

import Foundation

struct ErrorView {
    func printError(for error: Error) {
        print(error.localizedDescription)
    }
}

//
//  🧮Score.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 02.08.2024.
//

import SwiftUI

struct ItemScore {
    var keys: Bool = false
    var weapons: Bool = false
    var lives: Int = 0
    var coins: Int = 0
}

class Score: ObservableObject {
    @Published var itemScore = ItemScore()
    @Published var treasury: [TreasureItem] = Array(repeating: TreasureItem(), count: 3 * 10)
}

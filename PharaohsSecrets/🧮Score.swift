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
    private var _lives: Int = 3
    var coins: Int = 0
    
    var lives: Int {
        get {
            return min(_lives, 3)
        }
        set {
            _lives = min(newValue, 3)
        }
    }

    mutating func incrementLives() {
        lives += 1
    }
    
    mutating func decrementLives() {
        lives -= 1
    }
}

class Score: ObservableObject {
    @Published var itemScore = ItemScore()
    @Published var treasury: [TreasureItem] = Array(repeating: TreasureItem(), count: 3 * 10)
}

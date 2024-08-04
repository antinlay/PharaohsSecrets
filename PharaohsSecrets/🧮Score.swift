//
//  🧮Score.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 02.08.2024.
//

import SwiftUI

class Score: ObservableObject {
    @Published var offset: Double = 0
    @Published var direction: Direction = .right
    @Published var runnerPoint = CGRect()
    @Published var disableControl: Bool = true
    @Published var startGame: Bool = false
    
    @Published var itemScore = ItemScore()
    @Published var newTresury: TreasureItem? = nil
    @Published var treasury: [TreasureItem] = Array(repeating: TreasureItem(), count: 3 * 10)
    var isFirstLaunch: Bool = UserDefaults.standard.bool(forKey: "isFirstLaunch")
}

enum Direction {
    case left
    case right
    
    var value: Bool {
        switch self {
        case .left:
            false
        case .right:
            true
        }
    }
}

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

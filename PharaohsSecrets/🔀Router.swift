//
//  🔀Router.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 02.08.2024.
//

import Foundation

enum GameViews {
    case loading
    case menu
    case adventure
    case treasury
    case newTreasure
    
    case histories
    case game
    case youWin
    case tryAgain
    case winHistory
    case diedHistory
    case notDiscovered
    case pause
}

class Router: ObservableObject {
    @Published var currentView: GameViews = .loading
    
    func navigate(to view: GameViews) {
        currentView = view
    }
}

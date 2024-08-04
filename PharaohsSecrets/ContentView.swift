//
//  ContentView.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 16.07.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var score: Score
    
    var body: some View {
        Group {
            switch router.currentView {
            case .loading:
                Loading()
            case .menu:
                Menu()
            case .adventure:
                Adventure()
            case .treasury:
                Treasury()
            case .parachute:
                Parachute()
            case .histories:
                Histories()
            case .game:
                Game()
            case .youWin:
                YouWin()
            case .tryAgain:
                TryAgain()
            case .winHistory:
                WinHistory()
            case .diedHistory:
                DiedHistory()
            case .notDiscovered:
                NotDiscovered()
            case .pause:
                Pause()
            case .crashed:
                Crashed()
            }
        }
        .animation(.default, value: router.currentView)
    }
}

#Preview {
    ContentView()
        .environmentObject(Router())
        .environmentObject(Score())
}

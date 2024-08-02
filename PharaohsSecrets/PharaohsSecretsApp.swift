//
//  PharaohsSecretsApp.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 16.07.2024.
//

import SwiftUI

@main
struct PharaohsSecretsApp: App {
    @StateObject var router = Router()
    @StateObject var score = Score()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .environmentObject(score)
        }
    }
}

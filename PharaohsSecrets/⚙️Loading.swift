//
//  ⚙️Loading.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 16.07.2024.
//

import SwiftUI

struct Loading: View {
    @EnvironmentObject var router: Router
    
    private var splash: some View {
        Image(.Loading.splash)
            .frame(height: 170)
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Loading.background)
//                .scaleEffect(-1)
            splash
                .rotationEffect(Angle(degrees: -90))
        }
        .onAppear {
            // Симулируем загрузку данных
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                router.navigate(to: .menu)
            }
        }
    }
}

#Preview {
    Loading()
        .environmentObject(Router())
}

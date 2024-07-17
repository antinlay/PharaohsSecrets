//
//  ⚙️Loading.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 16.07.2024.
//

import SwiftUI

struct Loading: View {
    private var splash: some View {
        Image(.Loading.splash)
            .frame(height: 170)
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Loading.background)
            splash
        }
    }
}

#Preview {
    Loading()
}

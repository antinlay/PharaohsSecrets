//
//  ⚙️Loading.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 16.07.2024.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        ZStack {
            Image(.Loading.background)
                .resizable()
                .ignoresSafeArea()
            
            Image(.Loading.splash)
                .frame(height: 170)
        }
    }
}

#Preview {
    Loading()
}

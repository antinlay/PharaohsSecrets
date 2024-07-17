//
//  🧩FullScreenBackground.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 18.07.2024.
//

import SwiftUI

struct FullScreenBackground: ViewModifier {
    let imageResource: ImageResource
    
    func body(content: Content) -> some View {
        content
        Image(imageResource)
            .resizable()
            .ignoresSafeArea()
    }
}

extension View {
    func fullScreenBackground(_ imageResouces: ImageResource) -> some View {
        EmptyView()
            .modifier(FullScreenBackground(imageResource: imageResouces))
    }
}

//
//  🏆History.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 22.07.2024.
//

import SwiftUI

struct WinHistory: View {
    private var histories: [String] = [
                            """
                            I managed to go through part of the maze and find
                            some artifacts from the collection. But the
                            Egyptian tombs turned out to be even more
                            mysterious and unpredictable than I expected..
                            We'll have to continue our search!
                            
                            
                            
                            
                            
                            """]
    @State private var historyIndex = 0
    
    private var pharaohe: some View {
        Image(.Menu.pharaohe)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .offset(x: -84)
            .ignoresSafeArea()
    }
    
    private var historyText: some View {
        Text(histories[historyIndex])
            .font(.cabin(.bold, size: 22))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            .padding()
    }
    
    private var tappedNextImage: some View {
        Text("Tap to continue")
            .font(.cabin(.bold, size: 19))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .centerLastTextBaseline)
            .onTapGesture {
                // Переход на другое представление
            }
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            pharaohe
            historyText
                .animation(.easeOut, value: historyIndex)
            tappedNextImage
                .padding(.leading, 135)
                .padding(.bottom, 92)
        }
    }
}

#Preview {
    WinHistory()
}

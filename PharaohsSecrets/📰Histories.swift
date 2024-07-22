//
//  📰Histories.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 17.07.2024.
//

import SwiftUI

struct Histories: View {
    private var histories: [String] = [
                        """
                        My name is Adam. I have devoted my whole life to
                        solving the mysteries of the Egyptian pyramids.
                        Not so long ago I managed to meet a man who
                        saw with his own eyes the entrance to the
                        mysterious treasury...
                        
                        Unfortunately, he couldn't get inside and find out
                        what was hidden in it. I intend to complete his
                        journey!
                        """,
                        """
                        According to one of the legends, this treasury
                        contains a collection of magical artifacts over
                        which time has no power. The ancient Egyptian
                        king discovered them and locked them in one of
                        the pyramids. The treasury is hidden from human
                        eyes by labyrinths shrouded in cobwebs and
                        thickets, but the most important thing that scares
                        me...
                        """,
                        """
                        Ancient traps! And the pyramid, which is many
                        hundreds of years old, has clearly not been
                        preserved as well as artifacts endowed with
                        magical power.. For safety, I take some weapons
                        with me, and the professor, on whose tip I went on
                        a trip, advised me to take a parachute. I wonder
                        why I need it inside the pyramid..?
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
        Image(.Histories.next)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding()
            .onTapGesture {
                if historyIndex < histories.count - 1 {
                    historyIndex += 1
                } else {
                    // Переход на другое представление
                }
            }
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            pharaohe
            historyText
                .animation(.easeOut, value: historyIndex)
            tappedNextImage
        }
    }
}

#Preview {
    Histories()
}

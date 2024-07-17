//
//  1️⃣History.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 17.07.2024.
//

import SwiftUI

struct FirstHistory: View {
    var body: some View {
        ZStack {
            Image(.Histories.background)
                .resizable()
                .ignoresSafeArea()
            Image(.Menu.pharaohe)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .offset(x: -84)
                .ignoresSafeArea()
            Text("""
                "My name is Adam. I have devoted my whole life to
                solving the mysteries of the Egyptian pyramids.
                Not so long ago I managed to meet a man
                who saw with his own eyes the entrance to the
                mysterious treasury...
                     
                Unfortunately, he couldn't get inside and find out
                what was hidden in it. I intend to complete his
                journey!
                """)
            .foregroundStyle(.white)
            .font(.cabin(.bold, size: 22))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            .padding()
            
            Image(.Histories.next)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding()
        }
    }
}

#Preview {
    FirstHistory()
}

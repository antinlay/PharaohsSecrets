//
//  🏜️Ground.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 25.07.2024.
//

import SwiftUI

struct Ground: View {
    @EnvironmentObject var score: Score
    
    private var ground: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(0..<7, id: \.self) { index in
                Image(.Game.ground)
            }
            Image(.Game.miniFire)
        }
    }
    
    var body: some View {
                ground
                        
//            }
//                
//        }
//        .scrollDisabled(false)
        
    }
}

#Preview {
    Ground()
        .environmentObject(Score())
}

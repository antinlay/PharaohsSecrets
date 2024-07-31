//
//  🚥TreasuryStop.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 31.07.2024.
//

import SwiftUI

enum ChoosenTreasury: CaseIterable {
    case red
    case blue
    case brown
    
    var value: ImageResource {
        switch self {
        case .red:
                .TreasuryStop.redTreasury
        case .blue:
                .TreasuryStop.blueTreasury
        case .brown:
                .TreasuryStop.brownTreasury
        }
    }
}

struct TreasuryStop: View {
    @State private var selectedTreasury: ChoosenTreasury?
    
    var body: some View {
        HStack {
            ForEach(ChoosenTreasury.allCases, id: \.self) { treasury in
                Image(treasury.value)
                    .scaleEffect(selectedTreasury == treasury ? 1.2 : 0.8)
                    .opacity(selectedTreasury == treasury || selectedTreasury == nil ? 1.0 : 0.3)
                    .onTapGesture {
                        withAnimation {
                            selectedTreasury = treasury
                        }
                    }
            }
        }
    }
}

#Preview {
    TreasuryStop()
}

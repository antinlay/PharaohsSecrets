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
    @EnvironmentObject var score: Score
    @EnvironmentObject var router: Router
    
    @State private var isTreasurySelected = false
    @State private var isVStackHidden = false
    
    @State private var newTresureItem = TreasureItem()
    @State private var isShowingNewTresure: Bool = false
    @State private var selectedTreasury: ChoosenTreasury?
    @State private var treasureText = """
                It seems that something valuable is
                hidden here! I have a key.. But only one!
                We need to choose more carefully.
                """
    
    var body: some View {
        VStack {
            Text(treasureText)
                .multilineTextAlignment(.center)
                .font(.cabin(.bold, size: 19))
                .foregroundStyle(.white)
                .padding()
            
            HStack {
                ForEach(ChoosenTreasury.allCases, id: \.self) { treasury in
                    Image(treasury.value)
                        .scaleEffect(selectedTreasury == treasury ? 1.2 : 1)
                        .opacity(selectedTreasury == treasury || selectedTreasury == nil ? 1.0 : 0.3)
                        .onTapGesture {
                            if !isTreasurySelected {
                                withAnimation {
                                    selectedTreasury = treasury
                                    isTreasurySelected = true
                                }
                                
                                if let index = score.indexFirstClosedTreasury(), Bool.random() {
                                    score.treasury[index].toogleIsOpen()
                                    score.newTresury = score.treasury[index]
                                    if let item = score.newTresury {
                                        newTresureItem = item
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation {
                                            isShowingNewTresure = true
                                        }
                                    }
                                } else {
                                    treasureText = """
                                            The key didn't fit! It seems to be broken.
                                            Well, let's move on..
                                            """
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        isVStackHidden = true
                                        score.disableControl = false
                                    }
                                }
                            }
                        }
                }
            }
        }
        .opacity(isVStackHidden ? 0 : 1)
        .sheet(isPresented: $isShowingNewTresure) {
            NewTreasure(treasureItem: $newTresureItem)
        }
    }
}

extension Score {
    func indexFirstClosedTreasury() -> Int? {
        for index in treasury.indices {
            if !treasury[index].isOpen {
                return index
            }
        }
        return nil
    }
}

#Preview {
    TreasuryStop()
        .environmentObject(Router())
        .environmentObject(Score())
}

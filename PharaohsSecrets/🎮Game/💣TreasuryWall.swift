//
//  💣TreasuryWall.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 25.07.2024.
//

import SwiftUI

enum AnimationPhase: Double, CaseIterable {
    case start = -450
    case end = 400
}

struct TreasuryWall: View {
    @Binding var offsetHorizontal: Double
    @Binding var runnerPoint: CGRect
    @State private var offsetVertical: Double = 0
    @State private var randomBoxes: [TreasuryCell] = []
    @State private var coordinate = CGRect()
    @State private var timer: Timer?
    
    private var gridItems: some View {
        LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))], spacing: 10) {
            ForEach(1..<10, id: \.self) { index in
                TreasuryCell(runnerPoint: $runnerPoint, index: index)
                    .frame(width: 100, height: 100)
            }
        }
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView([.horizontal, .vertical]) {
                LazyVStack(spacing: 200) {
                    ForEach(0..<100, id: \.self) { _ in
                        gridItems
                    }
                }
                .offset(y: offsetVertical)
                .offset(x: offsetHorizontal)
            }
            .scrollDisabled(true)
            .ignoresSafeArea()
            .task {
                proxy.scrollTo(99, anchor: .bottom)
                startAnimation()
            }
        }
    }
    
    private func startAnimation() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            offsetVertical += 1
        }
    }
}

#Preview {
    TreasuryWall(offsetHorizontal: .constant(0), runnerPoint: .constant(CGRect(x: 60, y: 60, width: 100, height: 100)))
}

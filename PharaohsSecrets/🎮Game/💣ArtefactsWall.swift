//
//  💣ArtefactsWall.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 25.07.2024.
//

import SwiftUI

struct ArtefactsWall: View {
    @EnvironmentObject var score: Score
    
    @State private var offsetVertical: Double = 0
    @State private var timer: Timer?
    
    private var gridItems: some View {
        LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))], spacing: 10) {
            ForEach(1..<10, id: \.self) { index in
                ArtefactCell(index: index)
                    .frame(width: 100, height: 100)
            }
        }
    }
    
    private var verticalGridItems: some View {
        LazyVStack(spacing: 200) {
            ForEach(0..<100, id: \.self) { _ in
                gridItems
            }
        }
    }
    
    private var horizontalGridItems: some View {
        LazyHStack(spacing: 1000) {
            ForEach(0..<3, id: \.self) { index in
                verticalGridItems
            }
        }
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView([.horizontal, .vertical]) {
                horizontalGridItems
                    .offset(y: offsetVertical)
                    .offset(x: score.offset)
            }
            .scrollDisabled(true)
            .scrollIndicators(.never)
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
    ArtefactsWall()
        .environmentObject(Score())
}

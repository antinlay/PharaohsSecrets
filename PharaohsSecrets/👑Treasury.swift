//
//  👑Treasury.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 22.07.2024.
//

import SwiftUI

struct TreasureItem: Hashable {
    var items: [ImageResource] = [.Treasury.eagle, .Treasury.jugs, .Treasury.mummy, .Treasury.pharaoh, .Treasury.pyramids, .Treasury.upout]
    var placeholder: ImageResource = .TreasuryView.placeholder
    var value: ImageResource
    
    var isOpen: Bool = false {
        didSet {
            if isOpen && !oldValue {
                self.value = self.items.randomElement() ?? .Treasury.upout
            }
        }
    }
    
    var isPlaceHolder: Bool {
        value == placeholder
    }
    
    mutating func toogleIsOpen() {
        self.isOpen.toggle()
    }
    
    init() {
        self.value = self.placeholder
    }
}

struct TreasureItemView: View {
    @Binding var item: TreasureItem
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.randomTreasuryGradient)
                .blur(radius: 10)
                .frame(width: 65)
            Image(item.value)
        }
        .animation(.bouncy(duration: 1), value: item.isOpen)
        .frame(width: 97, height: 94)
    }
}

struct Treasury: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var score: Score
    
    @State private var selectedTab = 0
    @State private var isShowingInfo = false
    
    private var indexTabView: some View {
        HStack(spacing: 14) {
            ForEach(0..<3) { index in
                Image(index == selectedTab ? .TreasuryView.current : .TreasuryView.other)
                    .onTapGesture {
                        withAnimation {
                            selectedTab = index
                        }
                    }
            }
        }
        .background(.clear)
        .padding()
    }
    
    private func horizontalGrid(_ range: Range<Int>, _ treasury: Binding<[TreasureItem]>) -> some View {
        LazyHGrid(rows: [GridItem(.fixed(100)), GridItem(.fixed(100))], spacing: 14) {
            ForEach(range, id: \.self) { index in
                TreasureItemView(item: $score.treasury[index])
            }
        }
    }
    
    private var title: some View {
        Text("Treasury")
            .textCase(.uppercase)
            .font(.leagueGothic(.regular, size: 56))
            .foregroundStyle(Color.actionGradient)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top)
    }
    
    private var backButton: some View {
        Image(.TreasuryView.backButton)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 40)
            .onTapGesture {
                router.navigate(to: .menu)
            }
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
                .scaleEffect(1.43)
                .blur(radius: 11, opaque: true)
            backButton
            VStack {
                title
                    .onTapGesture {
                        isShowingInfo = true
                    }
                TabView(selection: $selectedTab) {
                    horizontalGrid(0..<10, $score.treasury).tag(0)
                    horizontalGrid(10..<20, $score.treasury).tag(1)
                    horizontalGrid(20..<30, $score.treasury).tag(2)
                }
                .frame(height: 210)
                .ignoresSafeArea()
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                indexTabView
            }
        }
        .sheet(isPresented: $isShowingInfo) {
            Adventure()
        }
    }
}

#Preview {
    Treasury()
        .environmentObject(Router())
        .environmentObject(Score())
}

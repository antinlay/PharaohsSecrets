//
//  👑Treasury.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 22.07.2024.
//

import SwiftUI

struct TreasuryItem: Hashable {
    var items: [ImageResource] = [.Treasury.eagle, .Treasury.jugs, .Treasury.mummy, .Treasury.pharaoh, .Treasury.pyramids, .Treasury.upout]
    var placeholder: ImageResource = .TreasuryView.placeholder
    var item: ImageResource
    
    var isOpen: Bool = false {
        didSet {
            if isOpen && !oldValue {
                self.item = self.items.randomElement() ?? .Treasury.upout
            }
        }
    }
    
    var isPlaceHolder: Bool {
        item == placeholder
    }
    
    init() {
        self.item = self.placeholder
    }
}

struct TreasuryItemView: View {
    @Binding var item: TreasuryItem
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.randomTreasuryGradient)
                .blur(radius: 10)
                .frame(width: 65)
            Image(item.item)
                .onTapGesture {
                    withAnimation {
                        item.isOpen = true
                    }
                }
        }
        .animation(.bouncy(duration: 1), value: item.isOpen)
        .frame(width: 97, height: 94)
    }
}

struct Treasury: View {
    @State private var treasury: [TreasuryItem] = Array(repeating: TreasuryItem(), count: 3 * 10)
    
    @State private var selectedTab = 0
    
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
    
    private func horizontalGrid(_ range: Range<Int>, _ treasury: Binding<[TreasuryItem]>) -> some View {
        LazyHGrid(rows: [GridItem(.fixed(100)), GridItem(.fixed(100))], spacing: 14) {
            ForEach(range, id: \.self) { index in
                TreasuryItemView(item: $treasury[index])
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
                // Назад
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
                
                TabView(selection: $selectedTab) {
                    horizontalGrid(0..<10, $treasury).tag(0)
                    horizontalGrid(10..<20, $treasury).tag(1)
                    horizontalGrid(20..<30, $treasury).tag(2)
                }
                .ignoresSafeArea()
                .frame(width: .infinity, height: 210)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                indexTabView
            }
        }
    }
}

#Preview {
    Treasury()
}

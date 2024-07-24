//
//  ➡️ScrollOffset.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 24.07.2024.
//

import SwiftUI

enum ScrollOffsetNamespace {

    static let namespace = "scrollView"
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}

struct ScrollViewOffsetTracker: View {

    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(
                    key: ScrollOffsetPreferenceKey.self,
                    value: geo
                        .frame(in: .named(ScrollOffsetNamespace.namespace))
                        .origin
                )
        }
        .frame(height: 0)
    }
}

private extension ScrollView {

    func withOffsetTracking(
        action: @escaping (_ offset: CGPoint) -> Void
    ) -> some View {
        self.coordinateSpace(name: ScrollOffsetNamespace.namespace)
            .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: action)
    }
}

public struct ScrollViewWithOffset<Content: View>: View {

    public init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        onScroll: ScrollAction? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.onScroll = onScroll ?? { _ in }
        self.content = content
    }

    private let axes: Axis.Set
    private let showsIndicators: Bool
    private let onScroll: ScrollAction
    private let content: () -> Content

    public typealias ScrollAction = (_ offset: CGPoint) -> Void

    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            ZStack(alignment: .top) {
                ScrollViewOffsetTracker()
                content()
            }
        }.withOffsetTracking(action: onScroll)
    }
}

struct ScrollOffset: View {
    @State private var move = true
    @State private var offset: CGFloat = 0
    @State private var velocity: CGFloat = 0
    @State private var timer: Timer? = nil
    
    let speed: CGFloat = 2 // Скорость перемещения
    let deceleration: CGFloat = 0.7 // Коэффициент замедления
    
    var body: some View {
        VStack {
            Button(action: {
                move.toggle()
                if move {
                    startScrolling()
                } else {
                    stopScrolling()
                }
            }) {
                Text(move ? "Stop" : "Start")
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    ForEach(0..<100, id: \.self) { index in
                        Image(systemName: "gamecontroller") // Замените на ваше изображение
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                }
                .offset(x: offset)
                .animation(.linear(duration: 0.1), value: offset)
            }
        }
        .onAppear {
            if move {
                startScrolling()
            }
        }
        .onDisappear {
            stopScrolling()
        }
    }
    
    func startScrolling() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            velocity = speed
            updateOffset()
        }
    }
    
    func stopScrolling() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            velocity *= deceleration
            if abs(velocity) < 0.1 {
                velocity = 0
                timer?.invalidate()
            }
            updateOffset()
        }
    }
    
    func updateOffset() {
        offset -= velocity
    }
}

#Preview {
    ScrollOffset()
}

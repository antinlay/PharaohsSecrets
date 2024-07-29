//
//  🕹️Control.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 25.07.2024.
//

import SwiftUI

enum Direction {
    case left
    case right
    
    var value: Bool {
        switch self {
        case .left:
            false
        case .right:
            true
        }
    }
}

struct Control: View {
    @Binding var isPressingState: Bool
    @Binding var offset: Double
    @Binding var direction: Direction
    
    @State private var timer: Timer?
    @State private var velocity: Double = 0
    
    @GestureState private var isPressing = false
    
    private let start: Double = 0
    private let end: Double = -3000
    private let speed: Double = 2 // Скорость перемещения
    
    private func run(_ toDirection: Direction) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            velocity = speed
            if isPressing {
                switch toDirection {
                case .left:
                    if offset <= start {
                        offset += velocity
                    }
                    direction = toDirection
                case .right:
                    if offset >= end {
                        offset -= velocity
                    }
                    direction = toDirection
                }
            }
        }
    }
    
    private var continuePressGesture: GestureStateGesture<SequenceGesture<LongPressGesture, LongPressGesture>, Bool> {
        LongPressGesture(minimumDuration: 0.1)
            .sequenced(before: LongPressGesture(minimumDuration: .infinity))
            .updating($isPressing) { value, state, transaction in
                switch value {
                case .second(true, nil):
                    state = true
                default:
                    break
                }
            }
    }
    
    private var control: some View {
        HStack {
            Image(.Game.control)
                .gesture(
                    continuePressGesture
                        .onChanged { _ in
                            run(.left)
                        }
                )
                .padding(.leading, 60)
            Spacer()
            Image(.Game.control)
                .rotationEffect(Angle(degrees: 180))
                .gesture(
                    continuePressGesture
                        .onChanged { _ in
                            run(.right)
                        }
                )
                .padding(.trailing, 60)
        }
    }
    
    var body: some View {
        control
            .onChange(of: isPressing) { newValue in
                isPressingState = newValue
            }
    }
}

#Preview {
    Control(isPressingState: .constant(false), offset: .constant(0), direction: .constant(.right))
}

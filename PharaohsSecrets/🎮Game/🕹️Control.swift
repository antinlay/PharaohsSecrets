//
//  🕹️Control.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 25.07.2024.
//

import SwiftUI

struct Control: View {
    @EnvironmentObject var score: Score
    
    @Binding var isPressingState: Bool
    
    @State private var timer: Timer?
    @State private var velocity: Double = 0
    
    @GestureState private var isPressing = false
    
    private let start: Double = 0
    private let end: Double = -5538
    private let speed: Double = 3 // Скорость перемещения
    
    private func run(_ toDirection: Direction) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            velocity = speed
            if isPressing {
                switch toDirection {
                case .left:
                    if score.offset <= start {
                        score.offset += velocity
                    }
                    score.direction = toDirection
                case .right:
                    if score.offset >= end {
                        score.offset -= velocity
                    }
                    score.direction = toDirection
                }
            }
        }
    }
    
    private var continuePressGesture: GestureStateGesture<SequenceGesture<LongPressGesture, LongPressGesture>, Bool> {
        LongPressGesture(minimumDuration: 0.05)
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
                .opacity(score.disableControl ? 0.5 : 1)
                .gesture(
                    continuePressGesture
                        .onChanged { _ in
                            run(.left)
                        }
                )
                .defersSystemGestures(on: .all)
                .disabled(score.disableControl)
                .padding(.leading)
            Spacer()
            Image(.Game.control)
                .rotationEffect(Angle(degrees: 180))
                .opacity(score.disableControl ? 0.5 : 1)
                .gesture(
                    continuePressGesture
                        .onChanged { _ in
                            run(.right)
                        }
                )
                .defersSystemGestures(on: .all)
                .disabled(score.disableControl)
                .padding(.trailing)
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
    Control(isPressingState: .constant(false))
        .environmentObject(Score())
}

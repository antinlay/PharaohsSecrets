//
//  🎮Game.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 23.07.2024.
//

import SwiftUI

enum ImagesAction: CaseIterable {
    case stay
    case start
    case step
    case substep
    case fly
    case jump
    case complete
    case dead
    
    var personImage: ImageResource {
        switch self {
        case .stay:
            return .Game.stay
        case .start:
            return .Game.start
        case .step:
            return .Game.step
        case .substep:
            return .Game.substep
        case .fly:
            return .Game.fly
        case .jump:
            return .Game.jump
        case .complete:
            return .Game.complete
        case .dead:
            return .Game.dead
        }
    }
}

struct Game: View {
    @Binding var score: Int
    @State var startGame: Bool = false
    @State var moveImage: ImagesAction = .stay
    
    @State private var groundOffset: CGFloat = 0
    @State private var velocity: CGFloat = 0
    @GestureState private var isPressing = false
    @State private var timer: Timer?
    @State private var position: CGPoint = .zero
    
    private let speed: CGFloat = 1 // Скорость перемещения
    private let deceleration: CGFloat = 0.7 // Коэффициент замедления
    
    private func moveToLeft() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            velocity = speed
            if isPressing {
                groundOffset += velocity
            }
        }
    }
    
    private func moveToRight() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            velocity = speed
            if isPressing {
                groundOffset -= velocity
            }
        }
    }
    
    private var startText: some View {
        Text("START!")
            .opacity(startGame ? .zero : 1)
            .font(.leagueGothic(.regular, size: 123))
            .foregroundStyle(Color.actionGradient)
    }
    
    private var tapToContinue: some View {
        Text("Tap to continue")
            .font(.cabin(.bold, size: 19))
            .foregroundStyle(.white)
            .opacity(startGame ? .zero : 1)
            .onTapGesture {
                withAnimation {
                    startGame = true
                }
            }
    }
    
    private var scoreboard: some View {
        Image(.Game.scoreboard)
            .overlay {
                Text("\(groundOffset)")
                    .font(.cabin(.bold, size: 31))
                    .foregroundStyle(.score)
            }
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    private var life: some View {
        HStack {
            Image(.Game.life)
            Image(.Game.life)
            Image(.Game.life)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    private var pause: some View {
        Image(.Game.pause)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .onTapGesture {
                //
            }
    }
    
    private var ground: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<10, id: \.self) { index in
                        Image(.Game.ground)
                    }
                }
                .offset(x: groundOffset)
                .animation(.linear(duration: 0.1), value: groundOffset)
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        //            .content.offset(x: groundOffset, y: 0)
        .animation(.linear, value: groundOffset)
        .scrollDisabled(true)
//        .onAppear {
//            if isPressing {
//                startScrolling()
//            }
//        }
//        .onDisappear {
//            stopScrolling()
//        }
    }
    
    private var control: some View {
        HStack {
            Image(.Game.control)
                .gesture(
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
                        .onChanged { _ in
                            moveToLeft()
                            startAnimation()
                        }
                )
                .padding(.leading, 60)
            Spacer()
            Image(.Game.control)
                .rotationEffect(Angle(degrees: 180))
                .gesture(
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
                        .onChanged { _ in
                            moveToRight()
                            startAnimation()
                        }
                )
                .padding(.trailing, 60)
        }
    }
    
    private var personImage: ImageResource {
        switch moveImage {
        case .stay:
            return .Game.stay
        case .start:
            return .Game.start
        case .step:
            return .Game.step
        case .substep:
            return .Game.substep
        case .fly:
            return .Game.fly
        case .jump:
            return .Game.jump
        case .complete:
            return .Game.complete
        case .dead:
            return .Game.dead
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
        groundOffset -= velocity
    }
    
    private func startAnimation() {
        if isPressing {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                switch moveImage {
                case .stay:
                    moveImage = .start
                case .start:
                    moveImage = .substep
                case .substep:
                    moveImage = .step
                case .step:
                    moveImage = .stay
                case .fly:
                    moveImage = .start
                case .jump:
                    moveImage = .substep
                case .complete:
                    moveImage = .step
                case .dead:
                    moveImage = .stay
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            ground
            Image(moveImage.personImage)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding(.leading, 150)
                .padding(.bottom)
            scoreboard
                .padding(.top, 25)
            pause
                .padding(.trailing, 65)
                .padding(.top, 25)
            life
                .padding(.leading, 65)
                .padding(.top, 30)
            control
            VStack {
                startText
                    .padding(.top, 50)
                tapToContinue
            }
        }
    }
}

#Preview {
    Game(score: .constant(122))
}

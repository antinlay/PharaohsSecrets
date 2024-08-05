//
//  🪂Parachute.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 04.08.2024.
//

import SwiftUI

struct Parachute: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var score: Score
    
    @State private var xCounter = 0
    @State private var timer: Timer?
    @State private var isOpenChute: Bool = false
    @State private var text = """
                 Oh no, the mechanism is broken, I can't
                 open the parachute!
                """
    
    private var runnerWithChute: some View {
        VStack(spacing: 0) {
            Image(.Game.chut)
                .offset(y: 60)
            Image(.Game.jump)
        }
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            Image(.Game.fire)
                .frame(maxHeight: .infinity, alignment: .bottom)
            
            if isOpenChute {
                runnerWithChute
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.leading, 150)
                    .padding(.top, -50)
                VStack {
                    Text("It worked! I think I see treasures...!")
                        .font(.cabin(.bold, size: 25))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    Text("Tap to continue")
                        .font(.cabin(.bold, size: 25))
                        .foregroundStyle(.white)
                        .opacity(0.6)
                        .onTapGesture {
                            router.navigate(to: .winHistory)
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .padding(.bottom, 100)
                .padding(.trailing, 100)
            } else {
                Text(text)
                .font(.cabin(.bold, size: 19))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 30)

                Image(.Game.fly)
                    .rotationEffect(Angle(degrees: -30))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.leading, 150)
                    .padding(.top, 80)
                VStack(spacing: 0) {
                    Text("x\(xCounter)")
                        .font(.cabin(.bold, size: 78))
                        .foregroundStyle(.white)
                    Image(.Game.redButton)
                        .overlay {
                            Text("OPEN")
                                .font(.cabin(.medium, size: 15))
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            withAnimation {
                                if xCounter > 160 {
                                    router.navigate(to: .crashed)
                                } else {
                                    score.itemScore.coins *= xCounter
                                    isOpenChute = true
                                }
                            }
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .padding(.trailing, 100)
                .padding(.bottom, 50)
            }

        }
        .ignoresSafeArea()
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if xCounter < 200 {
                xCounter += 1
            } else {
                stopTimer()
                router.navigate(to: .crashed)
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    Parachute()
        .environmentObject(Score())
        .environmentObject(Router())
}

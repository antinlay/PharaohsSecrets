//
//  🏃🏽‍♂️‍➡️Runner.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 25.07.2024.
//

import SwiftUI

enum ImagesAction: CaseIterable {
    case start
    case substep
    case step
    case complete
    
    var personImage: ImageResource {
        switch self {
        case .start:
            return .Game.start
        case .step:
            return .Game.step
        case .substep:
            return .Game.substep
        case .complete:
            return .Game.complete
        }
    }

}

struct Runner: View {
    @Binding var isPressing: Bool
    @State var moveImage: ImagesAction = .start
    @State private var timer: Timer?

    private func startAnimation() {
        timer?.invalidate() // Остановить предыдущий таймер, если он существует
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            switch moveImage {
            case .start:
                moveImage = .substep
            case .substep:
                moveImage = .step
            case .step:
                moveImage = .complete
            case .complete:
                moveImage = .start
            }
        }
    }

    private func stopAnimation() {
        timer?.invalidate()
        timer = nil
    }

    var body: some View {
        Image(moveImage.personImage)
            .onAppear {
                if isPressing {
                    startAnimation()
                }
            }
            .onDisappear {
                stopAnimation()
            }
            .onChange(of: isPressing) { newValue in
                if newValue {
                    startAnimation()
                } else {
                    stopAnimation()
                }
            }
    }
}

#Preview {
    Runner(isPressing: .constant(true))
}

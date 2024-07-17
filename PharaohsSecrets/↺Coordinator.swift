//
//  ↺Coordinator.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 17.07.2024.
//

import SwiftUI

struct PortraitViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: PortraitViewController

        init(_ parent: PortraitViewController) {
            self.parent = parent
        }
    }
}

extension PortraitViewController {
    var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

struct RotateCoordinator: View {
    var body: some View {
        ZStack {
            Image(.Loading.background)
                .resizable()
                .ignoresSafeArea()

            Image(.Loading.splash)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .background(PortraitViewController())
    }
}

#Preview {
    RotateCoordinator()
}

//
//  🌈Gradients.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 22.07.2024.
//

import SwiftUI

extension Color {
    static var actionGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.847, blue: 0.204, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.867, blue: 0.204, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.847, blue: 0.204, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.824, blue: 0.188, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.761, blue: 0.153, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.706, blue: 0.125, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.71, blue: 0.129, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.757, blue: 0.161, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.761, blue: 0.153, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.824, blue: 0.188, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.847, blue: 0.204, alpha: 1))]),
            startPoint: UnitPoint(x: 0.06, y: 0.0),
            endPoint: UnitPoint(x: 0.92, y: 0.98)
        )
    }
    
    static var youWinGradient: RadialGradient {
        RadialGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3215686275, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))]),
            center: .init(x: 0.4978, y: 0.2),
            startRadius: 0,
            endRadius: 50
        )
    }
    
    static var randomTreasuryGradient: RadialGradient {
        [Color.redTreasuryGradient, Color.cyanTreasuryGradient, Color.greenTreasuryGradient, Color.whiteTreasuryGradient, Color.pinkTreasuryGradient].randomElement() ?? Color.whiteTreasuryGradient
    }
    
    static var redTreasuryGradient: RadialGradient {
        RadialGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.179, blue: 0.179, alpha: 1)), .clear]),
            center: .center,
            startRadius: 20,
            endRadius: 65
        )
    }

    static var cyanTreasuryGradient: RadialGradient {
        RadialGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.196, green: 1, blue: 0.952, alpha: 1)), .clear]),
            center: .center,
            startRadius: 20,
            endRadius: 65
        )
    }
    
    static var greenTreasuryGradient: RadialGradient {
        RadialGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.26, green: 1, blue: 0, alpha: 1)), .clear]),
            center: .center,
            startRadius: 20,
            endRadius: 65
        )
    }
    
    static var pinkTreasuryGradient: RadialGradient {
        RadialGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.271, blue: 0.752, alpha: 1)), .clear]),
            center: .center,
            startRadius: 20,
            endRadius: 65
        )
    }

    static var whiteTreasuryGradient: RadialGradient {
        RadialGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), .clear]),
            center: .center,
            startRadius: 20,
            endRadius: 65
        )
    }
}


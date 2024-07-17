//
//  🧩Fonts.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 17.07.2024.
//

import SwiftUI

extension Font {
    static func cabin(_ weight: CabinWeight, size: CGFloat, isItalic: Bool = false) -> Font {
        let weightMapping: [CabinWeight: String] = [
            .thin: "Cabin-Thin",
            .extraLight: "Cabin-ExtraLight",
            .light: "Cabin-Light",
            .regular: "Cabin-Regular",
            .medium: "Cabin-Medium",
            .semibold: "Cabin-SemiBold",
            .bold: "Cabin-Bold",
            .extraBold: "Cabin-ExtraBold",
            .black: "Cabin-Black"
        ]
        
        var fontName = weightMapping[weight] ?? "Cabin-Regular"
        
        if isItalic {
            fontName += "-Italic"
        }

        return Font.custom(fontName, size: size)
    }
}

enum CabinWeight: String {
    case thin = "Thin"
    case extraLight = "ExtraLight"
    case light = "Light"
    case regular = "Regular"
    case medium = "Medium"
    case semibold = "SemiBold"
    case bold = "Bold"
    case extraBold = "ExtraBold"
    case black = "Black"
}

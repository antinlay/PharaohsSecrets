//
//  🧩Fonts.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 17.07.2024.
//

import SwiftUI

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

extension Font {
    static func cabin(_ weight: CabinWeight, size: CGFloat, isItalic: Bool = false) -> Font {
        Font.custom("Cabin-\(weight.rawValue)" + (isItalic ? "Italic" : "") , size: size)
    }
}

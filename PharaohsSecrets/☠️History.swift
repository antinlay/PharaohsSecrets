//
//  ☠️History.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 22.07.2024.
//

import SwiftUI

struct DiedHistory: View {
    private var description: String = """
                                        In a recent expedition to the Egyptian pyramids, a
                                        young archaeologist Adam Ryder tragically died.
                                        His equipment was not prepared for the hike and
                                        the young man crashed due to a malfunction of
                                        the parachute. We offer our condolences to
                                        Adam's family and loved ones.
                                        """
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            Image(.Histories.tablo)
                .overlay(alignment: .leading) {
                    Image(.Histories.pharaone)
                        .blendMode(.luminosity)
                        .padding(.bottom, -5)
                        .padding(.leading, 16)
                }
                .overlay(alignment: .topTrailing) {
                    Text("BREAKING NEWS")
                        .foregroundStyle(.white)
                        .font(.alumniSans(.medium, size: 58))
                        .padding(.top, 35)
                        .padding(.trailing, 60)
                }
                .overlay(alignment: .trailing) {
                    Text(description)
                        .foregroundStyle(.white)
                        .font(.cabin(.bold, size: 12))
                        .multilineTextAlignment(.trailing)
                        .padding(60)
                }
                .overlay(alignment: .bottomTrailing) {
                    Text("Tap to continue")
                        .foregroundStyle(.white)
                        .font(.cabin(.bold, size: 19))
                        .padding(60)
                        .onTapGesture {
                                // Переход на другое представление
                        }
                }
        }
    }
}

#Preview {
    DiedHistory()
}

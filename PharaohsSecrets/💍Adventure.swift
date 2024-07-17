//
//  💍Adventure.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 17.07.2024.
//

import SwiftUI

struct Adventure: View {
    @Environment(\.dismiss) var dismiss
    
    private var welcomeText: some View {
        Text("Welcome, adventurer!")
            .font(.cabin(.medium, size: 26))
            .foregroundStyle(.accent)
    }
    
    private var artefacts: some View {
        VStack(spacing: 3) {
            HStack(spacing: 3) {
                Image(.Adventure.triada)
                Image(.Adventure.mountans)
            }
            Image(.Adventure.sansara)
        }
    }
    
    private var artefactsDesription: some View {
        VStack(alignment: .leading) {
            Text("Your task is to collect the maximum number of coins and find all the mysterious artifacts.")
                .font(.cabin(.bold, size: 11))
                .frame(width: 167, height: 41, alignment: .leading)
            Text("The magic key will open the way to the most valuable artifacts of the collection.")
                .font(.cabin(.bold, size: 11))
                .frame(width: 207, height: 41, alignment: .leading)
        }
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Adventure.background)
            Image(.Adventure.tablo)
            VStack {
                welcomeText
                HStack(spacing: 50) {
                    artefactsDesription
                    artefacts
                        .padding(.bottom, 18)
                }
                VStack {
                    trapAndMagicDescription
                    HStack(spacing: 50) {
                        traps
                        magicPower
                    }
                }
            }
            .foregroundStyle(.dark)
            
            Text("Tap to continue")
                .font(.cabin(.bold, size: 11))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding()
                .onTapGesture {
                    dismiss()
                }
        }
    }
    
    private var traps: some View {
        HStack(spacing: 3) {
            Image(.Adventure.bomb)
            Image(.Adventure.pendant)
            Image(.Adventure.hryst)
        }
    }
    
    private var magicPower: some View {
        HStack(spacing: 3) {
            Image(.Adventure.ring)
            Image(.Adventure.almaz)
        }
    }
    
    private var trapAndMagicDescription: some View {
        HStack {
            Text("But the tomb holds a lot of traps! Try to avoid them.")
                .font(.cabin(.bold, size: 11))
                .frame(width: 116, height: 45, alignment: .leading)
                .multilineTextAlignment(.center)
            Text("You will need a weapon to pass through the mazes. And the magic power will help restore strength and health!")
                .font(.cabin(.bold, size: 11))
                .frame(width: 190, height: 45, alignment: .leading)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    Adventure()
}

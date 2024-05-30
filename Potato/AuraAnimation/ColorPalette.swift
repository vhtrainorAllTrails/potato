//
//  ColorPalette.swift
//  Potato
//
//  Created by Victoria Trainor on 5/30/24.
//

import SwiftUI

struct ColorPaletteView: View {
    let colorPalette: AuraAnimationViewModel.ColorPalette
    let numColors: Int

    init(colorPalette: AuraAnimationViewModel.ColorPalette) {
        self.colorPalette = colorPalette
        self.numColors = colorPalette.colors.count
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numColors, id: \.self) { i in
                VStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(colorPalette.colors[i])
                    Text(String(i))
                        .font(.caption)
                        .foregroundStyle(.primary)
                }
                
            }
        }
        .padding(.bottom, 24.0)

    }
}

#Preview {
    VStack {
        ColorPaletteView(colorPalette: AuraAnimationViewModel.nightPalette)
        ColorPaletteView(colorPalette: AuraAnimationViewModel.dayPalette)
        ColorPaletteView(colorPalette: AuraAnimationViewModel.rainyPalette)
    }
}

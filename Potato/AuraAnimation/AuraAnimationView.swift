//
//  AuraAnimationView.swift
//  Potato
//
//  Created by Victoria Trainor on 5/29/24.
//

import Foundation
import SwiftUI

struct AuraAnimationView: View {
    var body: some View {
        ScrollView {
            FloatingCloudWithPaletteView(colorPalette: AuraAnimationViewModel.dayPalette)
            FloatingCloudWithPaletteView(colorPalette: AuraAnimationViewModel.nightPalette)
            FloatingCloudWithPaletteView(colorPalette: AuraAnimationViewModel.rainyPalette)
        }
    }
}

struct FloatingCloudWithPaletteView: View {
    let colorPalette: AuraAnimationViewModel.ColorPalette

    var body: some View {
        VStack {
            Text(colorPalette.title)
                .font(.title2)
                .foregroundStyle(.primary)
            FloatingCloudView(colorPalette: colorPalette)
            ColorPaletteView(colorPalette: colorPalette)
        }
        .padding(.bottom, 24.0)
    }
}

// location
// size
// shouldn't be random

class CloudProvider: ObservableObject {
    let offset: CGSize
    let frameHeightRatio: CGFloat
    init() {
        frameHeightRatio = CGFloat.random(in: 0.7 ..< 1.4)
        offset = CGSize(width: CGFloat.random(in: -150 ..< 150),
                        height: CGFloat.random(in: -150 ..< 150))
    }
}

#Preview {
    ContentView()
 //    FloatingClouds(colorPalette: FloatingCloudViewModel.rainyPalette)
}

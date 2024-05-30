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
            AnimationWithPalette(colorPalette: FloatingCloudViewModel.nightPalette)
            AnimationWithPalette(colorPalette: FloatingCloudViewModel.dayPalette)
            AnimationWithPalette(colorPalette: FloatingCloudViewModel.rainyPalette)
        }
    }
}

struct Cloud: View {
    @StateObject var provider = CloudProvider()
    
    let color: Color
    let size: CGSize

    var body: some View {
        Ellipse()
            .fill(color)
            .frame(height: size.height /  provider.frameHeightRatio)
            .blur(radius: 80.0)
    }
}

struct AnimationWithPalette: View {
    let colorPalette: FloatingCloudViewModel.ColorPalette
    var body: some View {
        VStack {
            Text(colorPalette.title)
                .font(.title2)
                .foregroundStyle(.primary)
            FloatingClouds(colorPalette: colorPalette)
            ColorPaletteView(colorPalette: colorPalette)
        }
        .padding(.bottom, 24.0)
    }
}

struct FloatingClouds: View {
    @State private var angle: Double = 0
    @State private var animateCloud = false
    
    let colorPalette: FloatingCloudViewModel.ColorPalette

    var body: some View {
        ZStack{
            GeometryReader { proxy in
                let top = CGFloat(0.0)
                let bottom = proxy.size.height
                let middle = proxy.size.height / 2
                
                let left = proxy.size.width - 25
                let right = CGFloat(25)
                
                ZStack {
                    Cloud(color: colorPalette.colors[4], size: .init(width: 400.0, height: 200.0))
                        .position(.init(x: right, y: bottom))
                    Cloud(color: colorPalette.colors[0], size: .init(width: 300.0, height: 500.0))
                        .position(.init(x: right, y: middle))
                    Cloud(color: colorPalette.colors[2], size: .init(width: 400.0, height: 200.0))
                        .position(.init(x: left, y: middle))
                    Cloud(color: colorPalette.colors[1], size: .init(width: 400.0, height: 200.0))
                        .position(.init(x: right, y: top))
                    Cloud(color: colorPalette.colors[3], size: .init(width: 400.0, height: 200.0))
                        .position(.init(x: left, y: top))
                    Cloud(color: colorPalette.colors[4], size: .init(width: 400.0, height: 200.0))
                        .position(.init(x: left, y: bottom))
                    Cloud(color: colorPalette.colors[5], size: .init(width: 100.0, height: 400.0))
//                    Ellipse()
//                        .fill(.white)
//                        .frame(width: 100.0, height: 400.0)
//                        .position(.init(x: proxy.size.width/2, y: middle))

//                        .offset(
//                            x: proxy.size.width / 2,
//                            y: proxy.size.height / 2
//                        )
                        .transformEffect(CGAffineTransform(translationX: cos(angle)*100, y: sin(angle)*100))
                        .rotationEffect(.degrees(animateCloud ? 360 : 0))
                                        .animation(
                                            .linear(duration: 5)
                                            .repeatForever(autoreverses: false), value: animateCloud
                                        )

                        .onAppear {
                            withAnimation(Animation.linear(duration: 4).repeatForever(autoreverses: true)) {
                                angle = .pi  // Complete one full circle
                            }
                        }

                }
            }
        }
        .scaledToFit()
        .frame(width: 300.0, height: 600.0)
        .background(colorPalette.colors[0])
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .onAppear {
            self.animateCloud.toggle()
        }
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

//
//  FloatingCloudView.swift
//  Potato
//
//  Created by Victoria Trainor on 5/30/24.
//

import SwiftUI

struct FloatingCloudView: View {
    @State private var angle: Double = 0
    @State private var animateCloud = false
    
    let colorPalette: AuraAnimationViewModel.ColorPalette

    var body: some View {
        ZStack{
            GeometryReader { proxy in
                let top = CGFloat(25)
                let bottom = proxy.size.height
                let middle = (proxy.size.height / 2) - 25
                
                let left = proxy.size.width - 25
                let right = CGFloat(25)
                
                ZStack {
                    // top
                    Cloud(color: colorPalette.colors[1], size: .init(width: 400.0, height: 400.0))
                        .position(.init(x: right, y: top))
                    Cloud(color: colorPalette.colors[4], size: .init(width: 400.0, height: 400.0))
                        .position(.init(x: left, y: top))
                    //middle
                    Cloud(color: colorPalette.colors[4], size: .init(width: 300.0, height: 400.0))
                        .position(.init(x: right, y: middle))
                    Cloud(color: colorPalette.colors[2], size: .init(width: 400.0, height: 400.0))
                        .position(.init(x: left, y: middle))
                    // bottom
                    Cloud(color: colorPalette.colors[0], size: .init(width: 400.0, height: 400.0))
                        .position(.init(x: right, y: bottom))
                    Cloud(color: colorPalette.colors[3], size: .init(width: 400.0, height: 400.0))
                        .position(.init(x: left, y: bottom))
                    // animation
                    Cloud(color: colorPalette.colors[5], size: .init(width: 175.0, height: 150.0))
                        .offset(
                            x: proxy.size.width / 4,
                            y: proxy.size.height / 4
                        )
                        .transformEffect(CGAffineTransform(translationX: cos(angle)*250, y: sin(angle)))
                        .rotationEffect(.degrees(animateCloud ? 210 : 0)) // how far the circle goes
                                        .animation(
                                            .linear(duration: 5)
                                            .repeatForever(autoreverses: true), value: animateCloud
                                        )

                        .onAppear {
                            withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
                                angle = .pi  // Complete one full circle
                            }
                        }

                }
            }
        }
        .scaledToFit()
        .overlay(colorPalette.overlayColor)
        .scaledToFill()
        .frame(width: 300.0, height: 300.0)
        .background(colorPalette.colors[0])
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .onAppear {
            self.animateCloud.toggle()
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
            .blur(radius: 125.0)
    }
}

#Preview {
    ContentView()
 //    FloatingClouds(colorPalette: FloatingCloudViewModel.rainyPalette)
}

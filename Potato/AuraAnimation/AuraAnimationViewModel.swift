//
//  FloatingCloudViewModel.swift
//  Potato
//
//  Created by Victoria Trainor on 5/30/24.
//

import SwiftUI

struct AuraAnimationViewModel {
    static let dayPalette = ColorPalette(title: "Day",
                                         colors: WeatherColors.day,
                                         animationColor: Color(red: 0.77, green: 1.0, blue: 0.89),
                                         overlayColor: Color(red: 0.35, green: 0.62, blue: 0.87, opacity: 0.1))
    static let nightPalette = ColorPalette(title: "Night",
                                           colors: WeatherColors.night, 
                                           animationColor:  Color(red: 0.32, green: 0.08, blue: 0.36, opacity: 0.38),
                                           overlayColor: Color(red: 0.1, green: 0.42, blue: 0.55, opacity: 0.1))
    static let rainyPalette = ColorPalette(title: "Rainy",
                                           colors: WeatherColors.rainy,
                                           animationColor: Color(red: 0.08, green: 0.16, blue: 0),
                                           overlayColor: Color(red: 0.61, green: 0.77, blue: 0.9, opacity: 0.3))

    
    struct ColorPalette {
        let title: String
        var colors: [Color]
        let animationColor: Color
        let overlayColor: Color
    }
    
    struct WeatherColors {
        static let day = [Color(red: 0.35, green: 0.62, blue: 0.87),
                          Color(red: 0.77, green: 1.0, blue: 0.89),
                          Color(red: 0.27, green: 0.39, blue: 1),
                          Color(red: 0.07, green: 0.08, blue: 0.26),
                          Color(red: 0.41, green: 0.61, blue: 0.85),
                          Color(red: 1.0, green: 0.92, blue: 0.9, opacity: 0.49)
        ]
        
        static let night = [Color(red: 0.0, green: 0.0, blue: 0.0),
                            Color(red: 0.32, green: 0.08, blue: 0.36, opacity: 0.38),
                            Color(red: 0.1, green: 0.42, blue: 0.55),
                            Color(red: 0.1, green: 0.15, blue: 0.16),
                            Color(red: 0.18, green: 0.21, blue: 0.53),
                            Color(red: 0.2, green: 0.21, blue: 0.61),
        ]

        static let rainy = [Color(red: 0.26, green: 0.36, blue: 0.61),
                            Color(red: 0.08, green: 0.16, blue: 0),
                            Color(red: 0.16, green: 0.36, blue: 0.86),
                            Color(red: 0.39, green: 0.57, blue: 0.94),
                            Color(red: 0.56, green: 0.89, blue: 0.89, opacity: 0.41),
                            Color(red: 0.61, green: 0.77, blue: 0.9)
        ]
    }
}

#Preview {
    ContentView()
//    VStack {
//        ColorPaletteView(colorPalette: FloatingCloudViewModel.nightPalette)
//        ColorPaletteView(colorPalette: FloatingCloudViewModel.rainyPalette)
//        ColorPaletteView(colorPalette: FloatingCloudViewModel.dayPalette)
//    }
}

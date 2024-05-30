//
//  ContentView.swift
//  Potato
//
//  Created by Victoria Trainor on 5/29/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        AuraAnimationView()
    }
}

#Preview {
    ContentView()
}

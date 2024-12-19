//
//  ContentView.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        
        TabView {
            PlanetSelectionView()
                .navigationSplitViewStyle(.balanced)
                .tabItem {
                    Label("Planets", systemImage: "circle.grid.3x3.fill")
                }
            
            StarSelectionView()
                .navigationSplitViewStyle(.balanced)
                .tabItem {
                    Label("Stars", systemImage: "star.fill")
                }
        }
        
    }
}

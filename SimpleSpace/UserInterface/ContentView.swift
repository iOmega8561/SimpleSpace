//
//  ContentView.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            TabView {
                
                NavigationStack {
                    PlanetListView()
                }
                .tabItem { Image(systemName: "circle.grid.3x3.fill"); Text("Planets") }
                
                NavigationStack {
                    StarListView()
                }
                .tabItem { Image(systemName: "star.fill"); Text("Stars") }
            }
        }
    }
}

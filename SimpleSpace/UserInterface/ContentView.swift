//
//  ContentView.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ViewModel.self) private var model
    
    @State private var selectedPlanet: Planet? = nil
    @State private var selectedStar: Star? = nil
    
    var body: some View {
        
        TabView {
            NavigationSplitView {
                PlanetListView()
            } detail: {
                if selectedPlanet != nil{
                    List (planets, id: \.self, selection: $selectedPlanet) { planet in
                        PlanetView(planet: planet)
                    }
                } else {
                    PlanetView(planet: planets[2])
                }
            }
            .navigationSplitViewStyle(.balanced)
            .tabItem { Image(systemName: "circle.grid.3x3.fill"); Text("Planets") }
            
            NavigationSplitView {
                StarListView()
            } detail: {
                if selectedStar != nil{
                    List (stars, id: \.self, selection: $selectedStar) { star in
                        StarView(star: star)
                    }
                } else {
                    StarView(star: stars[0])
                }
            }
            .navigationSplitViewStyle(.balanced)
            .tabItem { Image(systemName: "star.fill"); Text("Stars") }
        }
        
    }
}

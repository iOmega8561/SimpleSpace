//
//  PlanetListView.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

struct PlanetListView: View {
    
    var body: some View {
        
        List(planets) { planet in
            
            NavigationLink(destination: PlanetView(planet: planet)) {
                HStack {
                    Image(planet.imgname)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    Text(planet.name)
                        .padding(.vertical)
                }
            }
            
        }
        .navigationTitle("Planets")
    }
}

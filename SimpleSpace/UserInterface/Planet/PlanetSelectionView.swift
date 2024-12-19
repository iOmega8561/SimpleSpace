//
//  PlanetListView.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

struct PlanetSelectionView: View {
    
    @Environment(SimpleSpaceViewModel.self) private var viewModel
    
    var body: some View {
        
        NavigationSplitView {
            
            List(planets) { planet in
                
                Button(action: { viewModel.selectedPlanet = planet }) {
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
            
        } detail: {
            
            PlanetDetailView(planet: viewModel.selectedPlanet ?? planets.first!)
                .onAppear {
                    viewModel.isShowing3DPlanet = false
                }
            
        }
    }
}

//
//  PlanetVolumeButton.swift
//  SimpleSpace
//
//  Created by Mariia Chemerys on 15.12.2024.
//

import SwiftUI

struct PlanetVolumeButton: View {
    
    @Environment(SimpleSpaceViewModel.self) private var viewModel
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    let planetVolumeID = "PlanetVolume"

    var body: some View {
        @Bindable var viewModel = viewModel
        
        Toggle("Show Planet", isOn: $viewModel.isShowing3DPlanet)
        
            .onChange(of: viewModel.isShowing3DPlanet) { _, isShowing in
                
                if viewModel.isShowing3DPlanet {
                    openWindow(id: planetVolumeID)
                    
                } else {
                    dismissWindow(id: planetVolumeID)
                }
            }
            .toggleStyle(.button)
    }
}

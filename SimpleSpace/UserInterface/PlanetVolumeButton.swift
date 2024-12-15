//
//  PlanetVolumeButton.swift
//  SimpleSpace
//
//  Created by Mariia Chemerys on 15.12.2024.
//

import SwiftUI

struct PlanetVolumeButton: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        @Bindable var model = model
        
        Toggle("Show Planet", isOn: $model.isShowingPlanet)
            .onChange(of: model.isShowingPlanet) { _, isShowing in
                if model.isShowingPlanet {
                    openWindow(id: "PlanetVolume")
                } else {
                    dismissWindow(id: "PlanetVolume")
                }
            }
            .toggleStyle(.button)
    }
}

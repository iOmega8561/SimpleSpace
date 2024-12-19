//
//  PlanetVolumeView.swift
//  SimpleSpace
//
//  Created by Mariia Chemerys on 15.12.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PlanetVolumeView: View {
    @Environment(SimpleSpaceViewModel.self) private var viewModel

    var body: some View {
        RealityView { content in

            do {
                let planetEntity = try await Entity(
                    named: viewModel.selectedPlanet?.name ?? planets.first!.name,
                    in: realityKitContentBundle
                )
                
                content.add(planetEntity)
                
            } catch {
                print("Failed to load the planet entity: \(error.localizedDescription)")
            }
        }
    }
}

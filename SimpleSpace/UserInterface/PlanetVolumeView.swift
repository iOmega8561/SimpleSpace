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
    @Environment(ViewModel.self) private var model

    var body: some View {
        RealityView { content in

            do {
                let planetEntity = try await Entity(named: model.planetShown?.name ?? "Earth", in: realityKitContentBundle)
                content.add(planetEntity)
            } catch {
                print("Failed to load the planet entity: \(error.localizedDescription)")
            }
        }
    }
}

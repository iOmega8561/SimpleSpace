//
//  PlanetVolume.swift
//  SimpleSpace
//
//  Created by Mariia Chemerys on 15.12.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PlanetVolumeView: View {
    @ObservedObject var model = ViewModel()

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

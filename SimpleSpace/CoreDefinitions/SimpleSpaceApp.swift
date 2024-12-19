//
//  SimpleSpaceApp.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

@main
struct SimpleSpaceApp: App {
    
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.openWindow) private var openWindow
    
    @State private var immersionStyle: ImmersionStyle = .mixed
    @State private var viewModel = SimpleSpaceViewModel()
    @State private var gestureModel = SimpleSpaceGestureModel()
    
    var body: some Scene {
        
        WindowGroup(id: .contentViewID) {
            ContentView()
                .environment(viewModel)
        }
        .windowResizability(.contentSize)
        
        WindowGroup(id: .planetOrbitButtonID) {
            PlanetOrbitButton()
                .fixedSize()
        }
        .windowResizability(.contentSize)
        
        WindowGroup(id: .planetVolumeID) {
            PlanetVolumeView()
                .environment(viewModel)
                .onDisappear {
                    viewModel.isShowing3DPlanet = false
                }
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)
        
        ImmersiveSpace(id: .planetOrbitImmersiveID) {
            PlanetOrbitView()
                .onDisappear {
                    openWindow(id: .contentViewID)
                }
                .environment(gestureModel)
        }
        .immersionStyle(selection: $immersionStyle, in: .full)
        
        ImmersiveSpace(id: .starHandTrackingImmersiveID) {
            StarHandTrackingView()
                .environment(gestureModel)
        }
        .persistentSystemOverlays(.hidden)
    }
}

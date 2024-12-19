//
//  PlanetOrbitView.swift
//  SimpleSpace
//
//  Created by Davide Castaldi on 10/12/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PlanetOrbitView: View {
    
    @Environment(SimpleSpaceGestureModel.self) private var gestureModel
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    var body: some View {
        
        RealityView { content in
            
            let scene = try? await Entity(
                named: "Scene",
                in: realityKitContentBundle
            )
            
            content.add(scene!)
            
            Task(priority: .userInitiated) { @MainActor in
                await gestureModel.start()
                await gestureModel.publishHandTrackingUpdates()
            }
            
        }
        .onChange(of: gestureModel.isSnapGestureActivated) { _, isActivated in
            if isActivated {
                handleSnapGesture()
            }
        }
        .onAppear {
            openWindow(id: .planetOrbitButtonID)
        }
    }
    
    private func handleSnapGesture() {
        
        dismissWindow(id: .planetOrbitButtonID)
        
        Task(priority: .userInitiated) { @MainActor in
            
            await dismissImmersiveSpace()
        }
    }
}

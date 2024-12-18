//
//  ContentView.swift
//  SimpleSpace
//
//  Created by Davide Castaldi on 10/12/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @Environment(GestureModel.self) private var gestureModel
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    let contentViewID = "ContentView"
    let buttonOverlayID = "ButtonOverlay"

    var body: some View {
        
        RealityView { content in
            let scene = try? await Entity(named: "Scene", in: realityKitContentBundle)
            content.add(scene!)
            
            Task {
                await gestureModel.start()
                await gestureModel.publishHandTrackingUpdates()
            }
        } update: { content in
            if gestureModel.snapGestureActivated() {
                
                dismissWindow(id: buttonOverlayID)
                Task { await dismissImmersiveSpace() }
            }
        }
        .onAppear {
            openWindow(id: buttonOverlayID)
        }
    }
}

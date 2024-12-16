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
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @State private var sceneEntity: Entity?
    
    let buttonOverlayID = "ButtonOverlay"

    var body: some View {
        
        RealityView { content in
            let scene = try? await Entity(named: "Scene", in: realityKitContentBundle)
            content.add(scene!)
        }
        .onAppear {
            openWindow(id: buttonOverlayID)
        }
        .onDisappear {
            dismissWindow(id: buttonOverlayID)
        }
    }
}

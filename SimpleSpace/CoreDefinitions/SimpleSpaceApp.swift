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
    
    @State private var immersionStyle: ImmersionStyle = .mixed
    @State private var model = ViewModel()
    
    let immersiveSpaceID = "ImmersiveSpace"
    let contentViewID = "ContentView"
    let buttonOverlayID = "ButtonOverlay"
    let planetVolumeID = "PlanetVolume"
    
    var body: some Scene {
        WindowGroup(id: contentViewID) {
            ContentView(model: model)
        }
        .windowResizability(.contentSize)
        
        WindowGroup(id: buttonOverlayID) {
            ButtonOverlay()
                .fixedSize()
        }
        .defaultWindowPlacement { content, context in
            
            //place the window in a cool way
            let size = content.sizeThatFits(.unspecified)
            if let contentViewWindow = context.windows.first(where: { $0.id == contentViewID }) {
                
                dismissWindow(id: contentViewID)
                return WindowPlacement(.trailing(contentViewWindow), size: size)
            } else {
                fatalError("ContentView window not found")
            }
        }
        
        // A volume that displays a planet
        WindowGroup(id: planetVolumeID) {
            PlanetVolumeView(model: model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)
        
        ImmersiveSpace(id: immersiveSpaceID) {
            ImmersiveView()
        }
        .immersionStyle(selection: $immersionStyle, in: .full)
    }
}

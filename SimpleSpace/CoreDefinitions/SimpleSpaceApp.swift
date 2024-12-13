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
    
    let immersiveSpaceID = "ImmersiveSpace"
    let contentViewID = "ContentView"
    let buttonOverlayID = "ButtonOverlay"
    
    var body: some Scene {
        WindowGroup(id: contentViewID) {
            ContentView()
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
        
        ImmersiveSpace(id: immersiveSpaceID) {
            ImmersiveView()
        }
        .immersionStyle(selection: $immersionStyle, in: .full)
    }
}

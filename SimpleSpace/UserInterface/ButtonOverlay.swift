//
//  ButtonOverlay.swift
//  Wuozzappen
//
//  Created by Davide Castaldi on 09/12/24.
//

import SwiftUI

struct ButtonOverlay: View {
    
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    let contentViewID = "ContentView"
    let buttonOverlayID = "ButtonOverlay"
    
    var body: some View {
        
        VStack(spacing: 20) {
            VStack {
                Text("Feeling overwhelmed?").font(.title)
                Text("Consider going back to reality.").font(.subheadline)
                Text("Click the button or \(Text("snap").fontWeight(.bold)) your fingers").font(.subheadline)
            }
            .multilineTextAlignment(.center)
            .padding()
            
            Button {
                dismissWindow(id: buttonOverlayID)
                Task { await dismissImmersiveSpace() }
                
            } label: {
                
                Text("Back")
                    .font(.title3)
            }
        }
        .padding()
    }
}

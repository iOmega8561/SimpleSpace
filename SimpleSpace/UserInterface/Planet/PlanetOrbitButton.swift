//
//  PlanetOrbitButton.swift
//  SimpleSpace
//
//  Created by Davide Castaldi on 09/12/24.
//

import SwiftUI

struct PlanetOrbitButton: View {
    
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        
        VStack(spacing: 20) {
            VStack {
                Text("Feeling overwhelmed?")
                    .font(.title)
                
                Text("Consider going back to reality.")
                    .font(.subheadline)
                
                Text("Click the button or \(Text("snap").fontWeight(.bold)) your fingers")
                    .font(.subheadline)
            }
            .multilineTextAlignment(.center)
            .padding()
            
            Button("Back") {
                dismissWindow(id: .planetOrbitButtonID)
                
                Task(priority: .userInitiated) { @MainActor in
                    
                    await dismissImmersiveSpace()
                }
                
            }
            .font(.title3)
        }
        .padding()
    }
}

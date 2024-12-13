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
    
    var body: some View {
        
        VStack(spacing: 20) {
            VStack {
                Text("Feeling overwhelmed?").font(.title)
                Text("Consider going back to reality").font(.subheadline)
            }
            .padding()
            Button {
                
                Task { await dismissImmersiveSpace() }
                openWindow(id: "ContentView")
                
            } label: {
                
                Text("Back")
                    .font(.title3)
            }
        }
        .padding()
    }
}

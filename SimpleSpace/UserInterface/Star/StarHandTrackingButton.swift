//
//  StarHandTrackingButton.swift
//  SimpleSpace
//
//  Created by Mariia Chemerys on 15.12.2024.
//

import SwiftUI

struct StarHandTrackingButton: View {
    
    @Environment(SimpleSpaceViewModel.self) private var viewModel
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
        
    var body: some View {
        @Bindable var viewModel = viewModel
        
        Toggle("Show Star", isOn: $viewModel.isShowing3DStar)
        
            .toggleStyle(.button)
        
            .onChange(of: viewModel.isShowing3DStar) {
                
                Task(priority: .userInitiated) { @MainActor in
                    
                    if viewModel.isShowing3DStar {
                        await openImmersiveSpace(
                            id: .immersiveHandTrackingSpaceID
                        )
                        
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            }

    }
}


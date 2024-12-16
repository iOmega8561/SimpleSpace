//
//  PlanetVolumeButton.swift
//  SimpleSpace
//
//  Created by Mariia Chemerys on 15.12.2024.
//

import SwiftUI

struct ImmersionViewButton: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    let immersiveHandTrackingSpaceID = "HandTrackingImmersiveSpace"
    
    var body: some View {
        @Bindable var model = model
        
        Toggle("Show Star", isOn: $model.isShowingStar)
            .toggleStyle(.button)
        
            .onChange(of: model.isShowingStar) {
                Task {
                    if model.isShowingStar {
                        await openImmersiveSpace(id: immersiveHandTrackingSpaceID)
                    } else{
                        await dismissImmersiveSpace()
                    }
                }
            }

    }
}


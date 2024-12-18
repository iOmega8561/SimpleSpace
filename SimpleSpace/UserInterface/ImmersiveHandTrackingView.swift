//
//  ImmersiveView.swift
//  Wuozzappen Demo Project
//
//  Created by Matt Novoselov on 09/12/24.
//

import SwiftUI
import RealityKit

struct ImmersiveHandTrackingView: View {
    
    @Environment(GestureModel.self) private var gestureModel
    @State private var sunEntity = SunEntity()
    @State private var explosionEntity = ExplosionEntity()

    var body: some View {
        
        RealityView { content in
            sunEntity.components.set(OpacityComponent(opacity: 1))
            content.add(sunEntity)
        } update: { content in
            let isGestureRecognized = gestureModel.areWristsClose()
            if isGestureRecognized{
                sunEntity.components[OpacityComponent.self]?.opacity = 0
                content.add(explosionEntity)
            }
        }

        .task {
            await gestureModel.start()
            await gestureModel.publishHandTrackingUpdates()
        }
        
    }
}

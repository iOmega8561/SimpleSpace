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
    @State private var sunDidExplode = false

    var body: some View {
        
        RealityView { content in
            sunEntity.components.set(OpacityComponent(opacity: 1))
            content.add(sunEntity)
            content.add(explosionEntity)
        } update: { content in
            let isGestureRecognized = gestureModel.areWristsClose()
            if isGestureRecognized && !sunDidExplode {
                sunDidExplode = true
                playDestroyAnimation()
            }
        }

        .task {
            await gestureModel.start()
            await gestureModel.publishHandTrackingUpdates()
        }
        
    }
    
    private func playDestroyAnimation(){
        sunEntity.components[OpacityComponent.self]?.opacity = 0
        
        
        if let rootParticleEmitter = explosionEntity.children.first {
            for child in rootParticleEmitter.children {
                child.components[ParticleEmitterComponent.self]!.burst()
            }
        }
    }
}

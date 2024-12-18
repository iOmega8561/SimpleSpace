//
//  SunEntity.swift
//  Wuozzappen Demo Project
//
//  Created by Matt Novoselov on 16/12/24.
//


import RealityKit
import RealityKitContent

// Function to load game table
@MainActor
func ExplosionEntity() -> Entity {
    
    let modelName = "Explosion Effect"
    let explosionEntity = try! ModelEntity.load(named: modelName, in: realityKitContentBundle)
    print("Successfully loaded \(modelName)")
    
    // Return composed entity
    return explosionEntity
}

//
//  Entity+Extension.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 19/12/24.
//

import RealityKit
import RealityKitContent

extension Entity {
    
    @MainActor
    static func explosionEntity() -> Entity {
        
        let modelName = "Explosion Effect"
        
        let explosionEntity = try! ModelEntity.load(
            named: modelName,
            in: realityKitContentBundle
        )
        
        print("Successfully loaded \(modelName)")
        
        // Return composed entity
        return explosionEntity
    }
    
    
    @MainActor
    static func sunEntity() -> Entity {
        
        let modelName = "SunEntity"
        
        let sunEntity = try! ModelEntity.load(
            named: modelName,
            in: realityKitContentBundle
        )
        
        print("Successfully loaded \(modelName)")
        
        // Return composed entity
        return sunEntity
    }
}

//
//  Planet.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import Foundation

struct Planet: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let imgname: String
    let description: String
    let diameter: Double          // in kilometers
    let mass: Double              // in kilograms
    let distanceFromSun: Double   // in million kilometers
    let orbitalPeriod: Double     // in Earth days
    let numberOfMoons: Int
    let hasRings: Bool
}

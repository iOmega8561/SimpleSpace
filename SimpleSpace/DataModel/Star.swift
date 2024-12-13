//
//  Star.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import Foundation

struct Star: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let imgname: String
    let description: String
    let type: String          // Star type (e.g., Main Sequence, Red Giant, White Dwarf)
    let mass: Double          // in kilograms
    let radius: Double        // in kilometers
    let luminosity: Double    // in terms of the Sun's luminosity (L☉)
    let distanceFromEarth: Double  // in light-years
    let age: Double           // in billion years
}

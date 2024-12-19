//
//  SimpleSpaceViewModel.swift
//  SimpleSpace
//
//  Created by Mariia Chemerys on 15.12.2024.
//

import SwiftUI

@MainActor
@Observable
class SimpleSpaceViewModel {
    
    var selectedPlanet: Planet?
    var selectedStar: Star?
    
    var isShowing3DPlanet: Bool = false
    var isShowing3DStar: Bool = false
}

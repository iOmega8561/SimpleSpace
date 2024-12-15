//
//  ViewModel.swift
//  SimpleSpace
//
//  Created by Mariia Chemerys on 15.12.2024.
//
import SwiftUI

/// The data that the app uses to configure its views.
@Observable
class ViewModel {
    var isShowingPlanet: Bool = false
    var planetShown: Planet?
}

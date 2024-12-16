//
//  ContentSpace.swift
//  SimpleSpace
//
//  Created by Salvatore Flauto on 11/12/24.
//

import SwiftUI

struct ContentViewPlanets: View {
	
	@State private var selectedPlanet: Planet? = nil
	
	var body: some View {
		NavigationSplitView {
			PlanetListView()
		} detail: {
			if selectedPlanet != nil{
				List (planets, id: \.self, selection: $selectedPlanet) { planet in
					PlanetView(planet: planet)
				}
			} else {
				PlanetView(planet: planets[0])
			}
		}
	}
}

#Preview {
	ContentViewPlanets()
}

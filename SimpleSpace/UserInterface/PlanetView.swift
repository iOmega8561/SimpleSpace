//
//  PlanetView.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

struct PlanetView: View {
    
    @Environment(ViewModel.self) private var model
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissWindow) private var dismissWindow
    
    let contentViewID = "ContentView"
    let immersiveSpaceID = "ImmersiveSpace"
    
    var planet: Planet
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Planet Image
                Image(planet.imgname)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: 4)
                    )
                    .shadow(radius: 10)
                
                // Planet Name
                Text(planet.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                PlanetVolumeButton()

                Text(planet.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                if planet.name == "Earth" {
                    Button {
                        Task { await openImmersiveSpace(id: immersiveSpaceID) }
                    } label: {
                        Text("Explore planet's orbit")
                            .font(.title2)
                    }
                }
                
                Divider()
                
                // Planet Details
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Diameter:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(planet.diameter, specifier: "%.0f") km")
                    }
                    HStack {
                        Text("Mass:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(planet.mass, specifier: "%.2e") kg")
                    }
                    HStack {
                        Text("Distance from Sun:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(planet.distanceFromSun, specifier: "%.1f") million km")
                    }
                    HStack {
                        Text("Orbital Period:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(planet.orbitalPeriod, specifier: "%.0f") Earth days")
                    }
                    HStack {
                        Text("Number of Moons:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(planet.numberOfMoons)")
                    }
                    HStack {
                        Text("Has Rings:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(planet.hasRings ? "Yes" : "No")
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            model.planetShown = planet
        }
    }
}

//
//  PlanetView.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

struct PlanetView: View {
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    
    var planet: Planet
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

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
                
                Text(planet.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text(planet.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                if planet.name == "Earth" {
                    Button {
                        Task { await openImmersiveSpace(id: "ImmersiveSpace") }
                    } label: {
                        Text("Explore planet's orbit")
                            .font(.title2)
                    }
                }
                
                Divider()
                
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
        .navigationTitle(planet.name)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//
//  StarView.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

struct StarView: View {
    @Environment(ViewModel.self) private var model
    
    var star: Star
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Star Image
                Image(star.imgname)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.orange, lineWidth: 4)
                    )
                    .shadow(radius: 10)
                
                // Star Name
                Text(star.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Star Description
                Text(star.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                Divider()
                
                // Star Details
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Type:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(star.type)
                    }
                    HStack {
                        Text("Mass:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(star.mass, specifier: "%.2e") kg")
                    }
                    HStack {
                        Text("Radius:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(star.radius, specifier: "%.0f") km")
                    }
                    HStack {
                        Text("Luminosity:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(star.luminosity, specifier: "%.1f") L☉")
                    }
                    HStack {
                        Text("Distance from Earth:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(star.distanceFromEarth, specifier: "%.1f") light-years")
                    }
                    HStack {
                        Text("Age:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(star.age, specifier: "%.1f") billion years")
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .padding()
        }
        .onAppear {
            model.isShowingPlanet = false
        }
    }
}

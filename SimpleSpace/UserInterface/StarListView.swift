//
//  StarListView.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

struct StarListView: View {
    @Environment(ViewModel.self) private var model
    
    var body: some View {
        
        List(stars) { star in
            
            NavigationLink(destination: StarView(star: star)) {
                HStack {
                    Image(star.imgname)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                    
                    Text(star.name)
                        .font(.headline)
                }
            }
            
        }
        .navigationTitle("Stars")
        .onAppear {
            model.isShowingPlanet = false
        }
    }
}

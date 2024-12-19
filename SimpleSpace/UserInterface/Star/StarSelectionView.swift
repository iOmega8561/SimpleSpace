//
//  StarSelectionView.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

struct StarSelectionView: View {
    
    @Environment(SimpleSpaceViewModel.self) private var viewModel
    
    var body: some View {
        
        NavigationSplitView {
            
            List(stars) { star in
                
                Button(action: { viewModel.selectedStar = star }) {
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
            
        } detail: {
            
            StarDetailView(star: viewModel.selectedStar ?? stars.first!)
                .onAppear {
                    viewModel.isShowing3DStar = false
                }
            
        }
    }
}

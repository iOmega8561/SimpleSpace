//
//  ContentViewStars.swift
//  SimpleSpace
//
//  Created by Salvatore Flauto on 11/12/24.
//

import SwiftUI

struct ContentViewStars: View {
	
	@State private var selectedStar: Star? = nil
	
	var body: some View {
		NavigationSplitView {
			StarListView()
		} detail: {
			if selectedStar != nil{
				List (stars, id: \.self, selection: $selectedStar) { star in
					StarView(star: star)
				}
			} else {
				StarView(star: stars[0])
			}
		}
		.navigationSplitViewStyle(.balanced)
	}
}

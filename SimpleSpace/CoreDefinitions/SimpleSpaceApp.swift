//
//  SimpleSpaceApp.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

import SwiftUI

@main
struct SimpleSpaceApp: App {
#if os(iOS)
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
#endif
	
#if os(visionOS)
	var body: some Scene {
		WindowGroup {
			ContentViewPlanets()
		}
		WindowGroup("star", id: "star") {
			ContentViewStars()
		}
	}
#endif
}

func openNewWindow() async {
	Task {
		await ContentViewStars()
	}
}

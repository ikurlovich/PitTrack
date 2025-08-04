//
//  PitTrackApp.swift
//  PitTrack
//
//  Created by Ilia Kurlovich on 02.08.25.
//

import SwiftUI
import SwiftData

@main
struct PitTrackApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinator()
                .preferredColorScheme(.light)
        }
        .modelContainer(for: [Car.self, Event.self])
    }
}

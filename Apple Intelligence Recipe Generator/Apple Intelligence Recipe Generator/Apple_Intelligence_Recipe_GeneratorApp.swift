//
//  Apple_Intelligence_Recipe_GeneratorApp.swift
//  Apple Intelligence Recipe Generator
//
//  Created by Rod Datham on 20/6/2024.
//

import SwiftUI
import SwiftData

@main
struct Apple_Intelligence_Recipe_GeneratorApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

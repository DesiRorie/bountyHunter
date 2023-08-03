//
//  RivalApp.swift
//  Rival
//
//  Created by Desi Rorie on 8/2/23.
//

import SwiftUI

@main
struct RivalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

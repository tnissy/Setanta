//
//  SetantaApp.swift
//  Setanta
//
//  Created by 西口竜也 on 2024/01/08.
//

import SwiftUI

@main
struct SetantaApp: App {
    let persistenceController = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

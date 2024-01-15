//
//  container.swift
//  Setanta
//
//  Created by 西口竜也 on 2024/01/08.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Training")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        })
    }
}


//
//  CoreDataStack.swift
//  PlaylistCoredata
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
   static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlaylistCoredata")
        container.loadPersistentStores { (_, error) in
            if let error = error{
                fatalError("failed to Load Persistent Stores \(error)")
            }
            
        }
        
        return container
    }()
   static var context: NSManagedObjectContext{
        return container.viewContext
    }
}


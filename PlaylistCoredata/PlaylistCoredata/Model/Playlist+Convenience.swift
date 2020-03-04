//
//  Playlist+Convenience.swift
//  PlaylistCoredata
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData

extension Playlist{
    
    convenience init(name: String, songs: [Song] = [], moc: NSManagedObjectContext) {
        self.init(context: moc)
        self.name = name
    }
}

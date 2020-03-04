//
//  Song+Convenience.swift
//  PlaylistCoredata
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData


extension Song {
    @discardableResult
    convenience init(title: String, artist: String,playlist: Playlist, moc: NSManagedObjectContext = CoreDataStack.context ) {
        
        self.init(context: moc)
        self.title = title
        self.artist = artist
    }
}

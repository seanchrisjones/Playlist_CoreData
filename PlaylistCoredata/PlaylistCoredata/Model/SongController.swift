//
//  SongController.swift
//  PlaylistCoredata
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData


class SongController {
    
    
    
    //MARK: CRUD
   static func createSong(with title: String, artist: String, addTo playlist: Playlist){
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.sharedInstance.saveToPersistentStore()
        
    }
    
  static func deleteSong(song: Song){
        CoreDataStack.context.delete(song)
        PlaylistController.sharedInstance.saveToPersistentStore()
        
    }
    

}
//END OF CLASS

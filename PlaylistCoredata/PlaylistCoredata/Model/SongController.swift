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
    func createSong(with title: String, artist: String, addTo playlist: Playlist){
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.sharedInstance.saveToPersistenStore()
        
    }
    
    func deleteSong(song: Song){
        CoreDataStack.context.delete(song)
        PlaylistController.sharedInstance.saveToPersistenStore()
        
    }
    

}
//END OF CLASS

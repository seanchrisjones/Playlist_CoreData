//
//  PlaylistController.swift
//  PlaylistCoredata
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData

class  PlaylistController {
    
    //MARK: SOURCE OF TRUTH
    var playlists: [Playlist]{
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
       return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    //MARK: SINGLETON
    static let sharedInstance = PlaylistController()
    
    //MARK: CRUD
    
    func createPlaylist(with name: String){
        Playlist(name: name)
        saveToPersistentStore()
    }
    func deletePlaylist(playlist: Playlist){
            CoreDataStack.context.delete(playlist)
            saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
        do{
            try CoreDataStack.context.save()
        }catch{
            print("There was an error saving the data!!! \(#function) \(error.localizedDescription)")
        }
    }

    
}
//end of class

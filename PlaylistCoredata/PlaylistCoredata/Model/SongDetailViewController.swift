//
//  SongDetailViewController.swift
//  PlaylistCoredata
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    
    //MARK: OUTLETS
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var songListTableView: UITableView!
    
    //MARK: PROPERTIES
    var playlistLandingPad:Playlist?
    
    //MARK: LIFECYCLE FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: ACTIONS
    @IBAction func addSongButton(_ sender: Any) {
       guard let title = songNameTextField.text,let  artist = artistNameTextField.text else{return}
        if let playlist = playlistLandingPad{
            SongController.createSong(with: title, artist: artist, addTo: playlist)}
    }
    
    
    
    
}

extension SongDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let  playlist = playlistLandingPad else {return 0}
        return playlist.songs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        guard let playlist = playlistLandingPad else {return UITableViewCell()}
        if let song = playlist.songs?[indexPath.row] as? Song{
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        return cell
    }
}

extension SongDetailViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let playlist = playlistLandingPad else {return}
        if editingStyle == .delete{
            let song = playlist.songs?[indexPath.row]
            SongController.deleteSong(song: song as! Song)
            PlaylistController.sharedInstance.saveToPersistentStore()
        }
    }
    
    
}

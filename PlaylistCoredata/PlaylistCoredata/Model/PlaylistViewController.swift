//
//  PlaylistViewController.swift
//  PlaylistCoredata
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController {

    @IBOutlet weak var playlistTableView: UITableView!
    @IBOutlet weak var playlistNameTextField: UITextField!
    
//MARK: LIFECYCLE FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
       playlistTableView.delegate = self
       playlistTableView.dataSource = self

    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let playlistName = playlistNameTextField.text  else {return}
        PlaylistController.sharedInstance.createPlaylist(with: playlistName)
        playlistTableView.reloadData()
    }
    
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            if let destinationViewController = segue.destination as? SongDetailViewController{
                if let indexPath = playlistTableView.indexPathForSelectedRow{
                    let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
                    destinationViewController.playlistLandingPad = playlist
                }
            }
        }
    }
   
}
extension PlaylistViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.sharedInstance.playlists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)
        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        let songCount = playlist.songs?.count ?? 0 // nil coalescing
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(songCount)"
        return cell
    }
    
}

extension PlaylistViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
            PlaylistController.sharedInstance.deletePlaylist(playlist: playlist)
            playlistTableView.deleteRows(at: [indexPath], with: .fade)
            
           
            
        }
    }
    
    
}

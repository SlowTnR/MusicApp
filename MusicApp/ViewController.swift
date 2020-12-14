//
//  ViewController.swift
//  MusicApp
//
//  Created by Ilja Patrushev on 14.12.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSongs()
        
        table.delegate = self
        table.dataSource = self
        
        
    }
    
    func configureSongs(){
        songs.append(Song(name: "Viva La Vds", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover1", trackName:"song1"))
        songs.append(Song(name: "Russkie Vpered", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover2", trackName:"song2"))
        songs.append(Song(name: "Moya Kurtka", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover3", trackName:"song3"))
        songs.append(Song(name: "Viva La Vds", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover1", trackName:"song1"))
        songs.append(Song(name: "Russkie Vpered", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover2", trackName:"song2"))
        songs.append(Song(name: "Moya Kurtka", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover3", trackName:"song3"))
        songs.append(Song(name: "Viva La Vds", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover1", trackName:"song1"))
        songs.append(Song(name: "Russkie Vpered", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover2", trackName:"song2"))
        songs.append(Song(name: "Moya Kurtka", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover3", trackName:"song3"))
        songs.append(Song(name: "Viva La Vds", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover1", trackName:"song1"))
        songs.append(Song(name: "Russkie Vpered", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover2", trackName:"song2"))
        songs.append(Song(name: "Moya Kurtka", albumName: "Dummy Stuff", artistName: "Valera", imageName: "cover3", trackName:"song3"))
  
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.font = UIFont(name: "Helveetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helveetica", size: 17)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // present player
        
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
        
            return
        }
        vc.songs = songs
        vc.position = position
        
        
        present(vc, animated: true)
    }


}

struct Song {
    
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}


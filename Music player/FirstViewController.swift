//
//  FirstViewController.swift
//  Music player
//
//  Created by Анастасия on 01.02.17.
//  Copyright © 2017 Anastasia. All rights reserved.
//

import UIKit
import AVFoundation

var songs:[String] = []
var audioPlayer = AVAudioPlayer()

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of rows
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //each sell init
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //click by cell
        do{
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch{
            print("Error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gettingSongNames()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gettingSongNames()
    {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        do{
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            for song in songPath
            {
                var mySong = song.absoluteString
                
                if mySong.contains(".mp3")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count - 1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " " )
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mySong)
                }
            }
            myTableView.reloadData()
        }
        catch{
            
        }
    }


}


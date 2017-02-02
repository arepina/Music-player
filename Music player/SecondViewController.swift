//
//  SecondViewController.swift
//  Music player
//
//  Created by Анастасия on 01.02.17.
//  Copyright © 2017 Anastasia. All rights reserved.
//
import AVFoundation
import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var MyImageView: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Label.text = songs[thisSong]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Play(_ sender: Any) {
        if audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
    
    @IBAction func Pause(_ sender: Any) {
        if audioPlayer.isPlaying == true
        {
            audioPlayer.pause()
        }
    }
    
    @IBAction func Next(_ sender: Any) {
        if thisSong + 1 != songs.count{
            playThis(thisOne: songs[thisSong + 1])
            thisSong += 1
            Label.text = songs[thisSong]
        }
    }
    
    @IBAction func Prev(_ sender: Any) {
        if thisSong != 0{
            playThis(thisOne: songs[thisSong - 1])
            thisSong -= 1
            Label.text = songs[thisSong]
        }
    }
    
    func playThis(thisOne:String)
    {
        do{
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch{
            print("Error")
        }

    }
    
    @IBAction func Slider(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }


}


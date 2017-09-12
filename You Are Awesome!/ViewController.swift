//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by oliver naser on 9/1/17.
//  Copyright © 2017 oliver naser. All rights reserved.
//
// Comment

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!

    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfImages = 6
    let numberOfSounds = 4
    
    
    // This code executes when the view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        //can we load in the sound file
        if let sound = NSDataAsset(name: soundName){
            // check if sound.data is a sound file
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                // if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound")
            }
        } else {
            //if reading in NSDataAsset didn't work tell the user / report didn't work
            print("ERROR: File \(soundName) didn't load")
        }
    }

    func nonRepeatingRandom(lastNumber: Int, maxValue:Int) -> Int {
        var newIndex = -1
        repeat{
            newIndex = Int(arc4random_uniform(UInt32(numberOfSounds)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    //MARK: - Actions
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn == false {
            if soundNumber != -1 {
            //stop playing
            awesomePlayer.stop()
        }
    }
}
    @IBAction func messageButtonPressed(_ sender: Any) {
        
         let messages = ["Pickles", "Greece", "Hoop", "Gyros", "Manny"]
        
        //showing messages
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //show an image
        awesomeImage.isHidden = false
        imageNumber = nonRepeatingRandom(lastNumber:  imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        if soundSwitch.isOn {
            //get a random number to play in our soundName file
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            //play a sound
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
            
        }
 
    }
}



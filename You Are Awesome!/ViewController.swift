//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Dom Ronan on 1/20/17.
//  Copyright © 2017 Dom Ronan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var awesomeImage: UIImageView!
    
    var awesomePlayer = AVAudioPlayer()
    
    var lastIndex = -1
    var lastImage = -1
    let numOfImages = 6
    let numOfSounds = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playSound(){
        var soundName = "sound" + String(arc4random_uniform(UInt32(numOfImages)))
        Int(arc4random_uniform(UInt32(numOfSounds)))
        
        
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
                } catch {
                    print("ERROR: Data from\(soundName) could not be played as an audio file")
            }
        } else {
            print("ERROR: Could not load data from file \(soundName)")
        }
    }
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Awesome!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "I Can't Wait to Use Your App!",
                        "You Are Da Bomb"]
        
        var randomIndex: Int = Int(arc4random_uniform(UInt32(messages.count)))
        var randomImage: Int = Int(arc4random_uniform(UInt32(numOfImages)))
        
        while randomIndex == lastIndex {
        randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
        }
        messageLabel.text = messages[randomIndex]
        lastIndex = randomIndex

        
        while randomImage == lastImage {
            randomImage = Int(arc4random_uniform(UInt32(numOfImages)))
        }
        awesomeImage.isHidden = false
        awesomeImage.image = UIImage(named: "image" + String(randomImage))
        lastImage = randomImage
        
        playSound()
        
        /*
        messageLabel.text = messages[index]
        if index == messages.count - 1 {
            index = 0
        } else {
           index = index + 1
        }
      */
        /*
        let message1 = "You Are Fantastic!!!"
        let message2 = "You Are Great!"
        let message3 = "You Are Amazing!"
        
        if messageLabel.text == message1 {
            messageLabel.text = message2
        } else if messageLabel.text == message2 {
            messageLabel.text = message3
        } else {
            messageLabel.text = message1
        }
 */
    }

}

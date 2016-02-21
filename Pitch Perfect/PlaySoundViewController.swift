//
//  PlaySoundViewController.swift
//  Pitch Perfect
//
//  Created by Federico on 22/01/2016.
//  Copyright (c) 2016 Federico. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            let url = NSURL.fileURLWithPath(filePath)
            audioPlayer = try? AVAudioPlayer(contentsOfURL: url)
            print("all good")
        } else {
            print("the file path is empty")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func playSound(playRate: Float) {
        audioPlayer.stop()
        audioPlayer.enableRate=true
        audioPlayer.rate = playRate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playSlowSound(sender: AnyObject) {
        playSound(0.5)
    }
    
    @IBAction func playFastSound(sender: AnyObject) {
        playSound(2.0)
    }
    
    
    @IBAction func stopPlaySound(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

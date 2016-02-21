//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Federico on 14/10/2015.
//  Copyright (c) 2015 Federico. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {
    
    //uiLabel called "recordInpogress"
    //IB = linked to the storyboard (Interfaee builder)
    // weak = manage memory for our variables
    // weak = someone else not me created that variable
    // ! at the end = optional value for variables
    @IBOutlet weak var recordInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
        recordButton.enabled = true
    }


    //skeleton button to record
    //IB = interface builder
    //IBAction tells me that this is not a normal function
    //..but that is connected to the storyboard or the interface builder
    @IBAction func recordAudio(sender: UIButton) {
        recordInProgress.hidden = false
        stopButton.hidden = false
        recordButton.enabled = false
        //TODO: record the user voice
        
        //get home directory path of the file and create unique file in there. 
        //make sure you handle cached data (currently no way to delete saved records)
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory,
            .UserDomainMask, true)[0] as String
        
        let currentDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDate)
        
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        //Setup Audio Session
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        
        //initalise audio recorder
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        
        audioRecorder.record()
        
        print("recording")
    }
    
    
    @IBAction func stopRecord(sender: UIButton) {
        recordInProgress.hidden = true
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        print("finished recording")
    }
    

}


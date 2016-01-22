//  view controller is created when we made our project.
//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Federico on 14/10/2015.
//  Copyright (c) 2015 Federico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //uiLabel called "recordInpogress"
    //IB = linked to the storyboard (Interfaee builder)
    // weak = manage memory for our variables
    // weak = someone else not me created that variable
    // ! at the end = optional value for variables
    @IBOutlet weak var recordInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
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
    }
    
    
    @IBAction func stopRecord(sender: UIButton) {
        recordInProgress.hidden = true
    }
    

}


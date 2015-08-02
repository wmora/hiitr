//
//  ViewController.swift
//  Hiitr
//
//  Created by William Mora on 2/8/15.
//  Copyright (c) 2015 nispok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var controlButton: UIButton!
    
    var currentState: SessionState?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentState = SessionState.Stopped
    }

    @IBAction func controlButtonPressed(sender: AnyObject) {
        currentState = currentState == SessionState.Stopped ? SessionState.Started: SessionState.Stopped
        controlButton.setTitle(currentState == SessionState.Stopped ? "Start" : "Stop", forState: UIControlState.Normal)
    }

}


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
    @IBOutlet weak var timerLabel: UILabel!
    
    var currentState: SessionState
    
    required init(coder aDecoder: NSCoder) {
        currentState = .Stopped
        super.init(coder: aDecoder)
    }

    @IBAction func controlButtonPressed(sender: AnyObject) {
        currentState = currentState == .Stopped ? .Started: .Stopped
        controlButton.setTitle(currentState == .Stopped ? "Start" : "Stop", forState: UIControlState.Normal)
    }
    
    func updateLabel() {
        
    }

}


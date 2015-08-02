//
//  ViewController.swift
//  HIITr
//
//  Created by William Mora on 2/8/15.
//  Copyright (c) 2015 nispok. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SessionEvents {
    
    @IBOutlet weak var controlButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var currentActivityLabel: UILabel!
    
    var currentState: SessionState
    var session: Session?
    
    required init?(coder aDecoder: NSCoder) {
        currentState = .Stopped
        super.init(coder: aDecoder)
        session = Session(delegate: self)
    }

    @IBAction func controlButtonPressed(sender: AnyObject) {
        switch currentState {
        case SessionState.Stopped:
            session?.start()
            currentState = .Started
        case SessionState.Started:
            session?.stop()
            currentState = .Stopped
        }
        updateTimerLabel()
    }
    
    func updateTimerLabel() {
        controlButton.setTitle(currentState == .Stopped ? "Start" : "Stop", forState: UIControlState.Normal)
    }
    
    func sessionStarted() {
        updateTimerLabel()
        intervalModeChanged(IntervalMode.Work)
    }
    
    func sessionStopped() {
        updateTimerLabel()
        currentActivityLabel.text = ""
    }
    
    func sessionUpdate(timeLeft: Int) {
        timerLabel.text = "\(timeLeft)"
    }
    
    func intervalModeChanged(newMode: IntervalMode) {
        currentActivityLabel.text = newMode == .Work ? "Work!" : "Rest"
    }

}


//
//  ViewController.swift
//  Hiitr
//
//  Created by William Mora on 2/8/15.
//  Copyright (c) 2015 nispok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let stopped = "stopped"
    let started = "started"
    
    @IBOutlet weak var controlButton: UIButton!
    
    var currentState: NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentState = stopped
    }

    @IBAction func controlButtonPressed(sender: AnyObject) {
        currentState = currentState!.isEqualToString(stopped) ? started: stopped
        controlButton.setTitle(currentState!.isEqualToString(stopped) ? "Start" : "Stop", forState: UIControlState.Normal)
    }

}


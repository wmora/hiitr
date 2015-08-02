//
//  Session.swift
//  Hiitr
//
//  Created by William Mora on 2/8/15.
//  Copyright (c) 2015 nispok. All rights reserved.
//

import Foundation

protocol SessionEvents {
    func sessionStarted()
    func sessionUpdate(timeLeft: Int)
    func sessionStopped()
}

class Session : NSObject {
    
    let workTime = 30
    let timerInterval: NSTimeInterval = 1
    
    var timer: NSTimer?
    var elapsedSeconds: NSInteger
    var delegate: SessionEvents?
    
    override init() {
        elapsedSeconds = 0
    }
    
    convenience init(delegate: SessionEvents) {
        self.init()
        self.delegate = delegate
    }
    
    func start() {
        if (timer != nil) {
            timer?.invalidate()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(timerInterval, target: self, selector: "timerUpdate:", userInfo: nil, repeats: true)
        elapsedSeconds = 0
        timer?.fire()
        delegate?.sessionStarted()
    }
    
    func stop() {
        timer?.invalidate()
        delegate?.sessionStopped()
    }
    
    func timerUpdate(timer: NSTimer) {
        delegate?.sessionUpdate(self.timeLeft())
        ++elapsedSeconds
        if (elapsedSeconds > workTime) {
            self.stop()
        }
    }
    
    func timeLeft() -> NSInteger {
        return workTime - elapsedSeconds
    }
}
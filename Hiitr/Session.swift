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
    func intervalModeChanged(newMode: IntervalMode)
}

class Session : NSObject {
    
    let workTime = 30
    let restTime = 60
    let timerInterval: NSTimeInterval = 1
    
    var timer: NSTimer?
    var elapsedSeconds: Int = 0
    var delegate: SessionEvents?
    var currentMode: IntervalMode = .Work
    
    convenience init(delegate: SessionEvents) {
        self.init()
        self.delegate = delegate
    }
    
    func start() {
        if (timer != nil) {
            timer?.invalidate()
        }
        elapsedSeconds = -1
        currentMode = .Work
        timer = NSTimer.scheduledTimerWithTimeInterval(timerInterval, target: self, selector: "timerUpdate:", userInfo: nil, repeats: true)
        timer?.fire()
        delegate?.sessionStarted()
    }
    
    func stop() {
        timer?.invalidate()
        delegate?.sessionStopped()
    }
    
    func timerUpdate(timer: NSTimer) {
        if (++elapsedSeconds >= (currentMode == .Work ? workTime : restTime)) {
            currentMode = currentMode == .Work ? .Rest : .Work
            delegate?.intervalModeChanged(currentMode)
            elapsedSeconds = 0
        }
        delegate?.sessionUpdate(self.timeLeft())
    }
    
    func timeLeft() -> NSInteger {
        return (currentMode == .Work ? workTime : restTime) - elapsedSeconds
    }
}
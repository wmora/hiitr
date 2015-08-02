//
//  SessionEvents.swift
//  Hiitr
//
//  Created by William Mora on 2/8/15.
//  Copyright © 2015 nispok. All rights reserved.
//

protocol SessionEvents {
    func sessionStarted()
    func sessionUpdate(timeLeft: Int)
    func sessionStopped()
    func intervalModeChanged(newMode: IntervalMode)
}
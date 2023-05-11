//
//  Scheduler.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 07/05/23.
//

import Foundation

class Scheduler {
    
    var timer: Timer?
    var timeInterval: TimeInterval
    var action: ()-> Void
    
    init(timeInterval: TimeInterval, action: @escaping ()-> Void) {
        self.timeInterval = timeInterval
        self.action = action
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(performAction), userInfo: nil, repeats: true)
        performAction() // initiate call at 0 second
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func performAction() {
        self.action()
    }
}

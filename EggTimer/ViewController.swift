//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTimes = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]
    
    var secondsRemaining = 60
    var eggTime = 0
    var timer: Timer? = nil

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        if hardness != nil && eggTimes[hardness!] != nil {
            progressView.progress = 0.0
            stopTimer()
            secondsRemaining = eggTimes[hardness!]!
            eggTime = eggTimes[hardness!]!
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo : nil, repeats: true)
        }
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            let percentage : Float = 1 - ((Float(secondsRemaining) / Float(eggTime)))
            progressView.progress = percentage
            print("\(secondsRemaining) seconds. percentage = \(percentage)")
            secondsRemaining -= 1
        } else {
            progressView.progress = 1.0
            titleLabel.text = "Done!"
            stopTimer()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}

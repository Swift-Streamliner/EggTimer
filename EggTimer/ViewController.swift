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
    
    let eggTimes = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]
    
    var secondsRemaining = 60
    var timer: Timer? = nil

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        if hardness != nil && eggTimes[hardness!] != nil {
            stopTimer()
            secondsRemaining = eggTimes[hardness!]!
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo : nil, repeats: true)
        }
        
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        } else {
            titleLabel.text = "Done!"
            stopTimer()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}

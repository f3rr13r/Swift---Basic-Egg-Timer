//
//  ViewController.swift
//  Egg Timer
//
//  Created by Harry Ferrier on 8/3/16.
//  Copyright © 2016 CASTOVISION LIMITED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Hook up label for displaying the time.
    @IBOutlet weak var timerLabel: UILabel!
    
    
    // Create time object of class Timer()
    var timer: Timer = Timer()
    
    // Create global variable 'startNumber' to store the initial value of the timer.
    var startNumber: Int = 210
    
    
    
    
    // processTimer function to be called by the scheduledTimer method.
    func processTimer() {
        
        // ** Take measures to avoid the timer going into negative numbers. **
        
        
        // If the value of startNumber is greater than zero.
        if startNumber > 0 {
        
            // Decrement startNumber by 1
            startNumber -= 1
        
            // Set the text property of the timerLabel to be the value of the startNumber variable.
            timerLabel.text = "\(startNumber)"
        
            
        // If the number is not greater than 1 (to catch it at zero)..
        } else {
        
            // Stop the timer object.
            timer.invalidate()
            
        }

    }
    
    
    
    
    // play function to be called when the playButton is pressed.
    @IBAction func play(_ sender: AnyObject) {
        
        // Access the timer objects's 'scheduledTimer' method, firing off the 'processTimer' function every 1 second until told otherwise.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        
    }
    
    
    
    // pause function to be called when the pauseButton is pressed.
    @IBAction func pause(_ sender: AnyObject) {
        
        // Stop the timer object and all of it's methods.
        timer.invalidate()
        
    }
    
    
    
    // addTenSeconds function to be called when the addTenSeconds is pressed.
    @IBAction func addTenSeconds(_ sender: AnyObject) {
        
        // If the value of startNumber is less than 201
        if startNumber < 201 {
        
            // Add 10 to the value of startNumber
            startNumber += 10
         
        // If the value of startNumber is NOT less than 201 (therefore less than 10 away from the starting value).
        } else {
        
            // subtract the value of startNumber from 210, and add it to startNumber.
            // E.g - if the value is 205..do 210 - 205 = 5, and add 5, which will bring the timer back up to 210, but no higher.
            startNumber += (210 - startNumber)
        
        }
        
        // Set the text property of the timerLabel to be the value of the startNumber variable.
        timerLabel.text = "\(startNumber)"
        
    }
    
    
    
    // subtractTenSeconds function to be called when the subtractTenSeconds is pressed.
    @IBAction func subtractTenSeconds(_ sender: AnyObject) {
        
        // If the value of startNumber is greater than 9 (therefore allowing 10 to be subtracted)...
        if startNumber > 9 {
            
            // Subtract 10 from the value of startNumber...
            startNumber -= 10
         
        // If the value of startNumber is less than 10 (therefore not having 10 left to be subtracted).
        } else {
        
            // Subtract the number which will reduce the value of startNumber to zero.
            startNumber -= (0 + startNumber)
        
        }
        
        // Set the text property of the timerLabel to be the value of the startNumber variable.
        timerLabel.text = "\(startNumber)"
        
    }
    
    
    
    // reset function to be called when the resetButton is pressed.
    @IBAction func reset(_ sender: AnyObject) {
        
        // Stop the timer object and all of it's methods.
        timer.invalidate()
        
        // Set the value of the startNumber variable to 210.
        startNumber = 210
        
        // set the text property of the timerLabel to be the value of the startNumber variable.
        timerLabel.text = "\(startNumber)"

    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        // Access the timer's 'scheduledTimer' method, call it every 1 second, set it's target to be the view, and set the function to be instantiated as the "processTimer" function.
        // We do not require any userInfo to be sent to our method, but we also want it to repeat the process automatically after each timeInterval has elapsed.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


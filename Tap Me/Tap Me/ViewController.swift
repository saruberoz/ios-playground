//
//  ViewController.swift
//  Tap Me
//
//  Created by Wilson Sumanang on 3/25/16.
//  Copyright © 2016 Wilson Sumanang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var timerLabel: UILabel!
  var count = 0
  var seconds = 0
  var timer = NSTimer()
  
  @IBAction func buttonPressed()  {
    count++
    scoreLabel.text = "Score \n\(count)"
  }
  
  func setupGame()  {
    seconds = 30
    count = 0
    
    timerLabel.text = "Time: \(seconds)"
    scoreLabel.text = "Score: \(count)"
    timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    setupGame()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  func subtractTime() {
    seconds--
    timerLabel.text = "Time: \(seconds)"
    
    if(seconds == 0)  {
      timer.invalidate()
      let alert = UIAlertController(title: "Time is up!",
        message: "You scored \(count) points",
        preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {
        action in self.setupGame()
      }))
      presentViewController(alert, animated: true, completion:nil)
    }
  }


}


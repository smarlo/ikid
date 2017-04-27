//
//  ViewController.swift
//  iKid
//
//  Created by Sabrina Niklaus on 4/24/17.
//  Copyright © 2017 Sabrina Niklaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var goodView: UIView!
    @IBOutlet var punView: UIView!
    @IBOutlet var dadView: UIView!
    
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var punLabel: UILabel!
    @IBOutlet weak var dadLabel: UILabel!
    
    var goodSwitched = true
    var punSwitched = true
    var dadSwitched = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getGoodPunchline(_ sender: UIButton) {
        jokeSwitch(switched: self.goodSwitched, view: goodView, label: goodLabel, button: sender, joke: "insert good joke", punchline: "insert punchline")
        self.goodSwitched = !self.goodSwitched
    }
    
    @IBAction func getPunPunchline(_ sender: UIButton) {
        jokeSwitch(switched: self.punSwitched, view: punView, label: punLabel, button: sender, joke: "insert pun joke", punchline: "insert punchline")
        self.punSwitched = !self.punSwitched
    }
    
    @IBAction func getDadPunchLine(_ sender: UIButton) {
        jokeSwitch(switched: self.dadSwitched, view: dadView, label: dadLabel, button: sender, joke: "insert dad joke", punchline: "insert punchline")
        self.dadSwitched = !self.dadSwitched
    }
    
    func jokeSwitch(switched: Bool, view: UIView, label: UILabel, button: UIButton, joke: String, punchline: String) {
        label.text = ""
        button.setTitle("", for: UIControlState.normal)
        if(switched) {
            UIView.transition(with: view, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                label.text = punchline
                button.setTitle("Back", for: UIControlState.normal)
            })
        } else {
            UIView.transition(with: view, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
                label.text = joke
                button.setTitle("Next", for: UIControlState.normal)
            })
        }
    }
}


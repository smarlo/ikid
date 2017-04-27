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
    @IBOutlet var knockKnockView: UIView!
    
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var punLabel: UILabel!
    @IBOutlet weak var dadLabel: UILabel!
    @IBOutlet weak var knockKnockLabel: UILabel!
    
    var goodSwitched = true
    var punSwitched = true
    var dadSwitched = true
    var knockKnockCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getGoodPunchline(_ sender: UIButton) {
        jokeSwitch(switched: self.goodSwitched, view: goodView, label: goodLabel, button: sender, joke: "What's a pirate's least favorite letter?", punchline: "Dear sir,\n Your internet access has been terminated due to illegal usage.\n Sincerely, your service provider.")
        self.goodSwitched = !self.goodSwitched
    }
    
    @IBAction func getPunPunchline(_ sender: UIButton) {
        jokeSwitch(switched: self.punSwitched, view: punView, label: punLabel, button: sender, joke: "There was an explosion at a cheese factory in France.", punchline: "De Brie everywhere")
        self.punSwitched = !self.punSwitched
    }
    
    @IBAction func getDadPunchLine(_ sender: UIButton) {
        jokeSwitch(switched: self.dadSwitched, view: dadView, label: dadLabel, button: sender, joke: "Why do chicken coops only have two doors?", punchline: "Because if they had four, they would be chicken sedans!")
        self.dadSwitched = !self.dadSwitched
    }
    
    @IBAction func knockKnockJoke(_ sender: UIButton) {
        self.knockKnockLabel.text = ""
        sender.setTitle("", for: UIControlState.normal)
        if(self.knockKnockCount == 1) {
            UIView.transition(with: self.knockKnockView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                self.knockKnockLabel.text = "Cow's go"
                sender.setTitle("Cow's go who?", for: UIControlState.normal)
            })
            self.knockKnockCount += 1
        } else if (self.knockKnockCount == 2) {
            UIView.transition(with: self.knockKnockView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                self.knockKnockLabel.text = "No silly, cows go MOO"
                sender.setTitle("Back", for: UIControlState.normal)
            })
            self.knockKnockCount += 1
        } else {
            UIView.transition(with: self.knockKnockView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
                self.knockKnockLabel.text = "Knock Knock"
                sender.setTitle("Who's there?", for: UIControlState.normal)
            })
            self.knockKnockCount = 1
        }
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


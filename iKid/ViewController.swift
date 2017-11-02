//
//  ViewController.swift
//  iKid
//
//  Created by Yongjun Park on 11/2/17.
//  Copyright © 2017 Yongjun Park. All rights reserved.
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
        jokeSwitch(switched: self.goodSwitched, view: goodView, label: goodLabel, button: sender, joke: "How do you break up a fight between two blind people?", punchline: "Yell: \"I bet my money on the guy with the knife!\"")
        self.goodSwitched = !self.goodSwitched
    }
    
    @IBAction func getPunPunchline(_ sender: UIButton) {
        jokeSwitch(switched: self.punSwitched, view: punView, label: punLabel, button: sender, joke: "Why is Peter Pan always flying around?", punchline: "Because he neverlands!")
        self.punSwitched = !self.punSwitched
    }
    
    @IBAction func getDadPunchLine(_ sender: UIButton) {
        jokeSwitch(switched: self.dadSwitched, view: dadView, label: dadLabel, button: sender, joke: "Dads are like boomerangs!", punchline: "I hope... :(")
        self.dadSwitched = !self.dadSwitched
    }
    
    @IBAction func knockKnockJoke(_ sender: UIButton) {
        self.knockKnockLabel.text = ""
        sender.setTitle("", for: UIControlState.normal)
        if(self.knockKnockCount == 1) {
            UIView.transition(with: self.knockKnockView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                self.knockKnockLabel.text = "Who's there?"
                sender.setTitle("Next", for: UIControlState.normal)
            })
            self.knockKnockCount += 1
        } else if (self.knockKnockCount == 2) {
            UIView.transition(with: self.knockKnockView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                self.knockKnockLabel.text = "To."
                sender.setTitle("Next", for: UIControlState.normal)
            })
            self.knockKnockCount += 1
        } else if (self.knockKnockCount == 3) {
            UIView.transition(with: self.knockKnockView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                self.knockKnockLabel.text = "To who?"
                sender.setTitle("Next", for: UIControlState.normal)
            })
            self.knockKnockCount += 1
        } else if (self.knockKnockCount == 4) {
            UIView.transition(with: self.knockKnockView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                self.knockKnockLabel.text = "To whom *"
                sender.setTitle("Back", for: UIControlState.normal)
            })
            self.knockKnockCount += 1
        } else {
            UIView.transition(with: self.knockKnockView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
                self.knockKnockLabel.text = "Knock! Knock!"
                sender.setTitle("Next", for: UIControlState.normal)
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


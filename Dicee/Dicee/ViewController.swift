//
//  ViewController.swift
//  Dicee
//
//  Created by AR7K on 3/25/21.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlet allows me to reference a UI element.
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
    
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        // WHERE.WHAT = VALUE
        diceImageView1.image = diceArray.randomElement()
        diceImageView2.image = diceArray[Int.random(in: 0...5)] // Same method to grab a random array but you specify a range.
    }
    
}


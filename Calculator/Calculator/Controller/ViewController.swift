//
//  ViewController.swift
//  Calculator
//
//  Created by AR7K on 3/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            let isInt = floor(newValue) == newValue
            if isInt {
                // Remove the .0
                displayLabel.text = String(format: "%.0f", newValue)
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            /* guard let vs. if let
             We use "guard let" in cases where we expect a value of an object to never be nil, but in case it is, we catch the error and cause the app to crash.
             We use "if let" in cases where we do sometimes expect a value of an object to be nil, and in cases where that is true, we simply have the app ignore those cases. */
            
            //            guard let result = calculator.calculate(symbol: calcMethod) else {
            //                fatalError("The results of the calculation is nil.")
            //            }
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue // Boolean value based on data comparison.
                    if !isInt {
                        return // "return" keyword by itself just exits the funtion.
                    }
                }
                displayLabel.text?.append(numValue)
            }
        }
    }
    
}


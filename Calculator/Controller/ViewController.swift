//
//  ViewController.swift
//  Calculator
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber : Bool = true
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!)else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set{
            displayLabel.text = newValue.isInt ? String(Int(newValue)) : String(newValue)
        }
    }
    private var logic = CalculatorLogic.logic
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            logic.setNumber(displayValue)
            if let result = logic.calculate(symbol: calcMethod){
                displayValue = result
                isFinishedTypingNumber = !(calcMethod == "=" || calcMethod == "AC")
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if( numValue == ".") {
                   //let isInt = floor(displayValue) == displayValue
                   //if !isInt {
                   //    return
                   //}
                   if let displayLabelText = displayLabel.text, displayLabelText.contains(".") {
                       return
                   }
                }
                displayLabel.text?.append(numValue)
                
            }
            
        }
    
    }

}


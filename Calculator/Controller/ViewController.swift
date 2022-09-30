//
//  ViewController.swift
//  Calculator
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    private var isFinishedTypingNumber : Bool = true
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!)else {
                //fatalError("Cannot convert display label text to a Double")
                return 0
            }
            return number
        }
        set{
            displayLabel.text = newValue.isInt ? Int(newValue).description : newValue.description
        }
    }
    private var logic = CalculatorLogic.logic
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            logic.setNumber(displayValue)
            highlightButton(symbol: calcMethod)
            if let result = logic.calculate(symbol: calcMethod){
                displayValue = result
                isFinishedTypingNumber = calcMethod.isTerminatingCharacter
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            highlightButton(symbol: numValue)
            if isFinishedTypingNumber {
                if( numValue == ".") {
                    displayLabel.text = String("0\(numValue)")
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTypingNumber = false
            } else {
                if( numValue == ".") {
                   if let displayLabelText = displayLabel.text, displayLabelText.contains(".") {
                       return
                   }
                }
                displayLabel.text?.append(numValue)
                
            }
            
        }
    
    }
    
    
    @IBAction func scientificButtonPressed(_ sender: UIButton) {
        if let calcMethod = sender.currentTitle {
            logic.setNumber(displayValue)
            if let result = logic.calculateScientific(symbol: calcMethod) {
                displayValue = result
                isFinishedTypingNumber = true
            } else {
                displayLabel.text = "Hata"
                isFinishedTypingNumber = true
            }
        }
    }
    
    func highlightButton(symbol: String) {
        switch symbol{
        case "+":
            addButton.backgroundColor = .black
        case "-":
            subtractButton.backgroundColor = .black
        case "×":
            multiplyButton.backgroundColor = .black
        case "÷":
            divideButton.backgroundColor = .black
        default:
            addButton.backgroundColor = UIColor(named: "buttonColor1")
            subtractButton.backgroundColor = UIColor(named: "buttonColor1")
            multiplyButton.backgroundColor = UIColor(named: "buttonColor1")
            divideButton.backgroundColor = UIColor(named: "buttonColor1")
        }
    }
    
    

}


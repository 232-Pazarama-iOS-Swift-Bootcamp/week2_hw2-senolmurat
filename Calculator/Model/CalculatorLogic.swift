//
//  CalculatorLogic.swift
//  Calculator.
//

import Foundation

struct CalculatorLogic{
    
    static let logic = CalculatorLogic()
    private var number: Double
    private var intermediateCalculation: (n1: Double , calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    private init(){
        self.number = 0
    }
    
    mutating func calculate(symbol: String) -> Double? {
        switch symbol{
            case "+/-":
                return number * -1
            case "AC":
                intermediateCalculation = nil
                return 0
            case "%":
                return number * 0.01
            case "=":
                let result: Double? = performTwoNumberCalculation(n2 : number)
                //if let operation = intermediateCalculation?.calcMethod{
                //    switch operation{
                //    case "+":
                //        intermediateCalculation?.n1 = 0
                //    case "-":
                //        intermediateCalculation?.n1 = 0
                //    case "×":
                //        intermediateCalculation?.n1 = 1
                //    case "÷":
                //        intermediateCalculation?.n1 = 1
                //    default:
                //        fatalError("Error")
                //    }
                //}
                intermediateCalculation = nil
                return result
            default:
                if intermediateCalculation == nil {
                    intermediateCalculation = (n1: number , calcMethod : symbol)
                } else {
                    intermediateCalculation = (n1: performTwoNumberCalculation(n2 : number) ?? number , calcMethod : symbol)
                }
                
        }
        
        return nil
    }
    
    private func performTwoNumberCalculation(n2 : Double) -> Double?{
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{
            switch operation{
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The Operation passed in does not match any of the cases...")
            }
        }
        return nil
    }
}

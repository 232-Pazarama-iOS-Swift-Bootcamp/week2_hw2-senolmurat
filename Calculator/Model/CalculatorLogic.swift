//
//  CalculatorLogic.swift
//  Calculator.
//

import Foundation

struct CalculatorLogic{
    
    private let pi: Double = Double.pi
    private let e: Double =  exp(1.0)
    
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
    
    func calculateScientific(symbol: String) -> Double? {
        switch symbol{
            case "𝝅":
                return pi
            case "x²":
                return pow(number, 2.0)
            case "x³":
                return pow(number, 3.0)
            case "2ˣ":
                return pow(2.0, number)
            case "e":
                return e
            case "eˣ":
                return pow(e, number)
            case "ln":
                return logB(val: number, forBase: e)
            case "10ˣ":
                return pow(10.0, number)
            case "√x":
                return pow(number, 0.5)
            case "log₁₀":
                return logB(val: number, forBase: 10.0)
            case "log₂":
                return log2(number)
            case "Rand":
                
                return Double.random(in: 0.0..<1.0)
            case "x!":
                if (!number.isInt) {
                    return nil
                }
                return Int(number).factorial
            case "sin":
                return sin(number * pi / 180.0)
            case "cos":
                return cos(number * pi / 180.0)
            case "tan":
                if Int(number) == 90 {
                    return nil
                }
                return tan(number * pi / 180.0)
            case "1/x":
                return pow(number, -1.0)
            case "sin⁻¹":
                return asin(number) * 180.0 / pi
            case "cos⁻¹":
                return acos(number) * 180.0 / pi
            case "tan⁻¹":
                return atan(number) * 180.0 / pi
            default:
                return 0.0
        }
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
                //fatalError("The Operation passed in does not match any of the cases...")
                return 0
            }
        }
        return nil
    }
    
    private func logB(val: Double, forBase base: Double) -> Double {
        return log(val)/log(base)
    }
}

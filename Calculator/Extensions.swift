//
//  Extensions.swift
//  Calculator
//
//

import Foundation

extension Double {
    var isInt: Bool {
        return floor(self) == self
    }
    
    var description: String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 14

            let number = NSNumber(value: self)
            let formattedValue = formatter.string(from: number)!
            return formattedValue
    }
    
}

extension Int {
    var description: String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 14

            let number = NSNumber(value: self)
            let formattedValue = formatter.string(from: number)!
            return formattedValue
    }
    
    var factorial: Double {
        return (1...self).map(Double.init).reduce(1.0, *)
    }
}

extension String {
    var isTerminatingCharacter: Bool  {
        switch self {
        case "÷": return false
        case "×": return false
        case "-": return false
        case "+": return false
        case "+/-": return false
        default: return true
        }
    }
}

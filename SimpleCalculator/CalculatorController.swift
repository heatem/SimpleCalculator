//
//  CalculatorController.swift
//  SimpleCalculator
//
//  Created by Heather Mason on 8/19/20.
//

import SwiftUI

struct CalculatorController {
    @EnvironmentObject var env: GlobalEnvironment
    private var accumulator: Double?
    
    mutating func performCalculation(_ symbol: String) {
        switch symbol {
        case "±":
            if let operand = accumulator {
                accumulator = -operand
            }
        case "%":
            if let operand = accumulator {
                accumulator = operand / 100
            }
        default:
            accumulator = 0
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}

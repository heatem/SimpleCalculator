//
//  CalculatorController.swift
//  SimpleCalculator
//
//  Created by Heather Mason on 8/19/20.
//

import SwiftUI

func makePosNeg(operand: Double) -> Double {
    return -operand
}

func makePercent(operand: Double) -> Double {
    return operand / 100
}

struct CalculatorController {
//    @EnvironmentObject var env: GlobalEnvironment
    private var accumulator: Double?
    
    private enum Operation {
        case reset
        case transformOperation((Double) -> Double)
        case arithmeticOperation((Double, Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
        "AC": Operation.reset,
        "±": Operation.transformOperation(makePosNeg),
        "%": Operation.transformOperation(makePercent),
        "÷": Operation.arithmeticOperation({$0 / $1}),
        "×": Operation.arithmeticOperation({$0 * $1}),
        "−": Operation.arithmeticOperation({$0 - $1}),
        "+": Operation.arithmeticOperation({$0 + $1}),
        "=": Operation.equals
    ]

    mutating func performCalculation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .reset:
                accumulator = 0
                break
            case .transformOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
                break
            case .arithmeticOperation(let function):
                if accumulator != nil {
                    pendingOperation = PendingOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingOperation()
            }
        }
    }
    
    private mutating func performPendingOperation() {
        if pendingOperation != nil && accumulator != nil {
            accumulator = pendingOperation!.calculate(with: accumulator!)
            pendingOperation = nil
        }
    }
    
    private var pendingOperation: PendingOperation?
    
    private struct PendingOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func calculate(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
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

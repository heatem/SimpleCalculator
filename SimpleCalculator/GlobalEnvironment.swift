//
//  GlobalEnvironment.swift
//  SimpleCalculator
//
//  Created by Heather Mason on 8/17/20.
//

import SwiftUI

class GlobalEnvironment: ObservableObject {
    @Published var display = "0"
    @Published var userTyped = false
    
    var displayValue: Double {
        get {
            return Double(display)!
        }
        
        set {
            display = String(newValue)
        }
    }
}

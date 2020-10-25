//
//  ArithmeticSymbols.swift
//  SimpleCalculator
//
//  Created by Heather Mason on 8/16/20.
//

import SwiftUI

struct ArithmeticSymbols: View {
    let width = UIScreen.main.bounds.width / 5
    @EnvironmentObject var env: GlobalEnvironment
    @Binding var controller: CalculatorController
    let symbols = ["÷", "×","−", "+", "="]
    
    var body: some View {
        VStack(spacing: width / 5) {
            ForEach(symbols, id: \.self) { symbol in
                Button("\(symbol)", action: {
                    self.env.userTyped = false
                    self.controller.setOperand(self.env.displayValue)
                    self.controller.performCalculation(symbol)
                    if let result = self.controller.result {
                        self.env.displayValue = result
                    }
                })
                .font(.system(size: 32))
                .frame(width: width, height: width)
                .foregroundColor(.white)
                .background(Color(.purple))
                .cornerRadius(width)
            }
        }
    }
}

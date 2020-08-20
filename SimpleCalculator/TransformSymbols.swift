//
//  TransformSymbols.swift
//  SimpleCalculator
//
//  Created by Heather Mason on 8/17/20.
//

import SwiftUI

struct TransformSymbols: View {
    let width = UIScreen.main.bounds.width / 5
    let transformSymbols = ["AC", "±", "%"]
    @EnvironmentObject var env: GlobalEnvironment
    @Binding var controller: CalculatorController
    
    var body: some View {
        HStack(spacing: width / 5) {
            ForEach(transformSymbols, id: \.self) { transformSymbol in
                Button("\(transformSymbol)", action: {
                    
                    if self.env.userTyped {
                        controller.setOperand(self.env.displayValue)
                        controller.performCalculation(transformSymbol)
                        if let result = self.controller.result {
                            self.env.displayValue = result
                        }
                    }
                })
                .font(.system(size: 32))
                .frame(width: width, height: width)
                .foregroundColor(.white)
                .background(Color(.blue))
                .cornerRadius(width)
            }
        }
    }
}

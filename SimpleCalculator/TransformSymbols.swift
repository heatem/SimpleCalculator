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
    
    var body: some View {
        HStack(spacing: width / 5) {
            ForEach(transformSymbols, id: \.self) { transformSymbol in
                Button("\(transformSymbol)", action: {
                    if self.env.userTyped {
                        self.transform(transformSymbol)
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
    
    func transform(_ symbol: String) {
        switch symbol {
        case "±":
            env.displayValue = -env.displayValue
        case "%":
            env.display = "\(env.displayValue / 100)"
        default:
            env.display = String(0)
        }
    }
}

//
//  ArithmeticSymbols.swift
//  SimpleCalculator
//
//  Created by Heather Mason on 8/16/20.
//

import SwiftUI

struct ArithmeticSymbols: View {
    let width = UIScreen.main.bounds.width / 5
    let symbols = ["÷", "×","−", "+", "="]
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        VStack(spacing: width / 5) {
            ForEach(symbols, id: \.self) { symbol in
                Button("\(symbol)", action: {
                    if env.userTyped {
                        env.display = "\(symbol)"
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

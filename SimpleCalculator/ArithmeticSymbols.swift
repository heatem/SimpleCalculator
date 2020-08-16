//
//  ArithmeticSymbols.swift
//  SimpleCalculator
//
//  Created by Heather Mason on 8/16/20.
//

import SwiftUI

struct ArithmeticSymbols: View {
    let width = UIScreen.main.bounds.width / 5
    let symbols = ["÷", "×","−", "+"]
    @Binding var display: String
    
    var body: some View {
        VStack(spacing: width / 5) {
            ForEach(symbols, id: \.self) { symbol in
                Button("\(symbol)", action: {
                        self.display = "\(symbol)"
                })
                .font(.system(size: 32))
                .frame(width: width, height: width)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(width)
            }
        }
    }
}

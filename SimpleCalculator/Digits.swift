//
//  Digits.swift
//  SimpleCalculator
//
//  Created by Heather Mason on 8/16/20.
//

import SwiftUI

struct Digits: View {
    let width = UIScreen.main.bounds.width / 5
    @EnvironmentObject var env: GlobalEnvironment
    
    let digitsRows = [
        [7, 8, 9],
        [4, 5, 6],
        [1, 2, 3],
        [0]
    ]
    
    var body: some View {
        ForEach(digitsRows, id: \.self) { row in
            HStack(spacing: width / 5) {
                ForEach(row, id: \.self) { digit in
                    Button("\(digit)", action: {
                        if self.env.userTyped {
                            env.display = env.display + "\(digit)"
                        } else {
                            env.display = "\(digit)"
                            env.userTyped = true
                        }
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
}

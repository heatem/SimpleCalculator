//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Heather Mason on 8/16/20.
//

import SwiftUI

struct ContentView: View {
    let width = UIScreen.main.bounds.width / 5
    @State var display = "0"
    
    var body: some View {
        VStack {
            Spacer()
            Text(display)
                .font(.system(size: 56))
                .padding(.all)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.leading)
                .padding(.trailing)
            HStack(alignment: .bottom, spacing: width / 5) {
                VStack(alignment: .center, spacing: width / 5) {
                    Digits(display: $display)
                }
                ArithmeticSymbols(display: $display)
            }
        }.padding(.bottom)
    }
}

//=±

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

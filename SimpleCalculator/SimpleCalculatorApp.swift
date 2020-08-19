//
//  SimpleCalculatorApp.swift
//  SimpleCalculator
//
//  Created by Heather Mason on 8/16/20.
//

import SwiftUI

@main
struct SimpleCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GlobalEnvironment())
        }
    }
}

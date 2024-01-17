//
//  Extensions.swift
//  mySpending
//
//  Created by Abdullah Abdulkareem on 1/13/24.
//


import SwiftUI

extension Color {
    static func randomColor() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

extension Double {
    func myCurrency() -> String {
        return "$" + String(format: "%.2f", arguments: [self])
    }
}

extension Expense{
    static let example = Expense(name: "Cake", amount: 20.00, quantity: 1, description: "Slice of cake")
}

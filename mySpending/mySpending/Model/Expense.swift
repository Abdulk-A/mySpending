//
//  Expense.swift
//  mySpending
//
//  Created by Abdullah Abdulkareem on 1/12/24.
//

import Foundation

struct Expense: Identifiable, Equatable, Codable {
    var id = UUID()
    let name: String
    let amount: Double
    let quantity: Int
    let description: String?
}


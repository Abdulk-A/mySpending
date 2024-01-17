//
//  Expenses.swift
//  mySpending
//
//  Created by Abdullah Abdulkareem on 1/12/24.
//

import Foundation


@Observable
class Expenses {
    
    var myExpenses: [Expense] {
        didSet{
            if let encoded = try? JSONEncoder().encode(myExpenses){
                UserDefaults.standard.setValue(encoded, forKey: "myExpenses")
            }
        }
    }
    
    init() {
        
        if let data = UserDefaults.standard.data(forKey: "myExpenses") {
            if let decodedData = try? JSONDecoder().decode([Expense].self, from: data) {
                myExpenses = decodedData
                return
            }
        }
        
        myExpenses = []
    }
}

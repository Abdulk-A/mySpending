//
//  DescriptionView.swift
//  mySpending
//
//  Created by Abdullah Abdulkareem on 1/16/24.
//

import SwiftUI

struct DescriptionView: View {
    var expense: Expense
    var body: some View {
        VStack{

            VStack(spacing: 8){
                Text("\(expense.quantity) \(expense.name)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("\(expense.amount.myCurrency())")
                    .foregroundStyle(.white.opacity(0.7))
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            Text(expense.description ?? "N/A")
                .font(.headline)
            Spacer()
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.myPurple.opacity(0.85))
        .monospaced()
    }
}

#Preview {
    DescriptionView(expense: Expense.example)
}

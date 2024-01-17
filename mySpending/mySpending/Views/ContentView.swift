//
//  ContentView.swift
//  mySpending
//
//  Created by Abdullah Abdulkareem on 1/12/24.
//

import Charts
import SwiftUI

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showAdd = false
    

    var body: some View {
        NavigationStack{
            
            VStack {
                Chart(expenses.myExpenses){ expense in
                    SectorMark(angle: .value("money", expense.amount))
                        .foregroundStyle(by: .value("expense", expense.name))
                }
                .padding()
                List{
                    ForEach(expenses.myExpenses){ expense in
                        NavigationLink{
                            DescriptionView(expense: expense)
                        } label: {
                            HStack{
                                HStack{
                                    Image(systemName: "creditcard")
                                        .foregroundStyle(.red)
                                    Text(expense.name)
                                        .bold()
                                }
                                .font(.title3)
                                Spacer()
                                Text(expense.amount.myCurrency())
                                    .font(.headline)
                            }
                        }
                    }
                    .onDelete(perform: { indexSet in
                        expenses.myExpenses.remove(atOffsets: indexSet)
                    })
                }
                .navigationTitle("Expenses")
                .toolbar{
                    Button{
                        showAdd.toggle()
                    } label: {
                        Text("ADD")
                            .bold()
                    }
                }
                .sheet(isPresented: $showAdd, content: {
                    AddExpense(expenses: expenses)
            })
            }
        }
        .preferredColorScheme(.dark)
        .monospaced()
    }
}

#Preview {
    ContentView()
}

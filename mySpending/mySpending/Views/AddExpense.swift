//
//  AddExpense.swift
//  mySpending
//
//  Created by Abdullah Abdulkareem on 1/12/24.
//

import SwiftUI

struct AddExpense: View {
    
    @State private var name: String = ""
    @State private var price: Double = 0
    @State private var quantity: Int = 0
    @State private var explain: String? = nil
    @State private var isAddingDescription = false

    var myQuantity: Int{
        quantity + 1
    }
    
    @Environment(\.locale) private var locale
    @Environment(\.dismiss) var dismiss
    
    var expenses: Expenses
    
    var body: some View {

        NavigationStack {
            VStack{
                Spacer()
                HStack{
                    TextField("Candy Bar", text: $name)
                        
                        .frame(minHeight: 40)
                        .background(.green.opacity(0.4))
                    Spacer()
                    TextField("0.00", value: $price, format: .currency(code: locale.currency?.identifier ?? "USD"))
                        .frame(minHeight: 40)
                        .background(.blue.opacity(0.4))
                        .keyboardType(.decimalPad)
                }
                .frame(maxWidth: .infinity)
                .font(.headline.monospaced())
                
                
                Spacer()
                    .frame(maxHeight: 50)
                Picker("Quantity", selection: $quantity) {
                    ForEach(1..<101){ i in
                        Text(String(i))
                    }
                }
                .containerRelativeFrame(.vertical){ size, Axis in
                    size * 0.7
                }
                .pickerStyle(.wheel)
                .background(.red.opacity(0.3))
 
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .padding()
//            .navigationTitle("ADD")
            .sheet(isPresented: $isAddingDescription) {
                AddDescription(explain: $explain)
            }
            .toolbar{
                Button {
                    let value = price * Double(myQuantity)
                    
                    let expense = Expense(name: name, amount: value, quantity: myQuantity, description: explain)
                    expenses.myExpenses.append(expense)
                    dismiss()
                } label: {
                    Image(systemName: "plus")
                }
                
                Button{
                    isAddingDescription.toggle()
                } label: {
                    Text("Describe")
                        .font(.headline.bold())
                        .foregroundStyle(.green.opacity(0.8))
                }
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.red)
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .monospaced()

    }
    
}

#Preview {
    AddExpense(expenses: Expenses())
}

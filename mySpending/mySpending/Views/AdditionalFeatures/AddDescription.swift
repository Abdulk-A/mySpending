//
//  AddDescription.swift
//  mySpending
//
//  Created by Abdullah Abdulkareem on 1/16/24.
//

import SwiftUI

struct AddDescription: View {
    
    @Binding var explain: String?
    
    @State private var expenseDescription = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("Describe the item")
                .font(.title2)
                .foregroundStyle(.secondary)

            TextField("Title", text: $expenseDescription,  axis: .vertical)
                
                .lineLimit(15...50)
                .background(.brown.opacity(0.3))
                .overlay(alignment: .bottom){
                    Button{
                        explain = expenseDescription
                        dismiss()
                    } label: {
                        Text("Add Description")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.orange.opacity(0.2))
                            
                    }
                }
                

        }
        
        .padding()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        .monospaced()
    }
}

#Preview {
    
    AddDescription(explain: .constant("Example description"))
}

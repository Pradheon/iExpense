//
//  ContentView.swift
//  JoshanRai-iExpense
//
//  Created by Joshan Rai on 3/7/22.
//
//  Made with help from: https://www.hackingwithswift.com/100/swiftui/36

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        VStack {
            List {
                ForEach(numbers, id: \.self) {
                    Text("Row \($0)")
                }
                .onDelete(perform: removeRows)
            }
            
            Button("Add Number") {
                numbers.append(currentNumber)
                currentNumber += 1
            }
        }
        .toolbar {
            EditButton()
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct SecondView: View {
    @Environment (\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

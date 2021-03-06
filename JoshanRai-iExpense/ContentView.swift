//
//  ContentView.swift
//  JoshanRai-iExpense
//
//  Created by Joshan Rai on 3/7/22.
//
//  Made with help from: https://www.hackingwithswift.com/100/swiftui/36

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var list: [(id: Int, name: String, items: [ExpenseItem])] {
            [
                (0, "Personal", expenses.items.filter { $0.type == "Personal" }),
                (1, "Business", expenses.items.filter { $0.type == "Business" }),
            ]
        }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(list, id:\.name) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                Text(item.amount, format: currencyFormat)
                                    .expenseForegroundColor(for: item)
                            }
                        }
                        .onDelete(perform: {removeItems(at: $0, in: section.id)})
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in section: Int) {
        for index in offsets {
            let element = list[section].items[index]
            if let elementIndex = expenses.items.firstIndex(where: {
                $0.id == element.id
            }) {
                expenses.items.remove(at: elementIndex)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

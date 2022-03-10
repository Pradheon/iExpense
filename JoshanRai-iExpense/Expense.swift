//
//  ExpenseItem.swift
//  JoshanRai-iExpense
//
//  Created by Joshan Rai on 3/9/22.
//

import Foundation


struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

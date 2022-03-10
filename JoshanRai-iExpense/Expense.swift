//
//  ExpenseItem.swift
//  JoshanRai-iExpense
//
//  Created by Joshan Rai on 3/9/22.
//

import Foundation
import SwiftUI


struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
    let currencyCode = Locale.current.currencyCode ?? "USD"
    return FloatingPointFormatStyle<Double>.Currency(code: currencyCode)
}


struct ExpenseForegroundColor: ViewModifier {
    let expenseItem: ExpenseItem
    
    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<10:
            content
                .foregroundColor(Color.green)
        case 10..<100:
            content
                .foregroundColor(Color.yellow)
        default:
            content
                .foregroundColor(Color.red)
        }
    }
}

extension View {
    func expenseForegroundColor(for expenseItem: ExpenseItem) -> some View {
        modifier(ExpenseForegroundColor(expenseItem: expenseItem))
    }
}

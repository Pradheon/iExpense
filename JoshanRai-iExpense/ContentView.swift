//
//  ContentView.swift
//  JoshanRai-iExpense
//
//  Created by Joshan Rai on 3/7/22.
//
//  Made with help from: https://www.hackingwithswift.com/100/swiftui/36

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@twostraws")
        }
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

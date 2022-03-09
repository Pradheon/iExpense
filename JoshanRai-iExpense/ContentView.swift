//
//  ContentView.swift
//  JoshanRai-iExpense
//
//  Created by Joshan Rai on 3/7/22.
//
//  Made with help from: https://www.hackingwithswift.com/100/swiftui/36

import SwiftUI

//   Why @State only works with structs
//   Sharing SwiftUI stat with @StateObject
class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    //   Why @State only works with structs
    //   Sharing SwiftUI stat with @StateObject
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            //   Why @State only works with structs
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name: ", text: $user.firstName)
            TextField("Last name: ", text: $user.lastName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

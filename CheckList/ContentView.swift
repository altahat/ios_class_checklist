//
//  ContentView.swift
//  CheckList
//
//  Created by zaid on 2/23/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    /*
     Use Arrays.
     Let's respond to actions when an item is clicked.
     We have a problem: The ’self is immutable’ error message.
     Reason:
     *By default*, code inside a struct object is not allowed to change the
     values of that struct’s properties.
     *Normally*, only code outside the struct is allowed to do that.
     One way  to change that is the use of @State
     */
    @State var checklistItems = ["Walk the dog", "Brush my teeth", "Learn",
                          "Soccer practice", "Eat ice cream"]
    var body: some View {
        NavigationView {
            List {
                Text(checklistItems[0])
                    .onTapGesture {
                        self.checklistItems[0] = "Take the dog to the vet" }
                Text(checklistItems[1])
                Text(checklistItems[2])
                Text(checklistItems[3])
                Text(checklistItems[4])
            } .navigationBarTitle("Checklist")
        } }
}

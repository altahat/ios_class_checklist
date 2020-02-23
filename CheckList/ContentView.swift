//
//  ContentView.swift
//  CheckList
//
//  Created by zaid on 2/23/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            /*
             There are two styles of List: plain and grouped.
             Right now, the app’s List uses the plain style.
             Use the plain style for lists where all the items in the list are
             similar to one another, yet independent.
             Using the grouped style requires the following:
             1. Using List’s listStyle() to specify that the list should use
             the grouped style.
             2. Adding a Section inside the List for each group,
             which appears as a separate sublist within the list.
             Sections can contain their own headers.
             */
            //## Test
            List {
                Section(header: Text("High priority")) {
                    Text("Walk the dog")
                    Text("Brush my teeth")
                    Text("Learn iOS development")
                }
                Section(header: Text("Low priority")) {
                    Text("Soccer practice")
                    Text("Eat ice cream")
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Checklist")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

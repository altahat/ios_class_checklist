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
     Use Loops.
     Let's print the list and do something on onAppear
     */
    @State var checklistItems = [
        "Walk the dog",
        "Brush my teeth",
        "Learn iOS development",
        "Soccer practice",
        "Eat ice cream"
    ]
    var body: some View {
        NavigationView {
            List {
                Text("Nothing to see here...yet!") }
                .navigationBarTitle("Checklist")
                .onAppear() {
                    self.printChecklistContents() }
        } }
    func printChecklistContents() {
        for item in checklistItems {
            print(item)
        }
    }
}

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
     Let's create the list with forEach
     
     forEach(collection_of_data, id: object_ID) { current_collection_item in
         //The block: The code that takes current_collection_item
         //and truns it into a View
     }
     
     */
    @State var checklistItems = [
        "Walk the dog",
        "Brush my teeth",
        "Learn iOS development",
        "Soccer practice",
        "Eat ice cream",
        "Walk a 100 miles",
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self) { item in
                    Text(item) }
            } .navigationBarTitle("Checklist") .onAppear() {
                self.printChecklistContents() }
        } }
    func printChecklistContents() {
        for item in checklistItems {
            print(item)
        }
    }
}

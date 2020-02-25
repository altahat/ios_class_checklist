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
     Let's delete items
     
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
                    Text(item)
                        .onTapGesture {
                            self.checklistItems.remove(at: 0)
                            self.printChecklistContents() }
                }
            }
            .navigationBarTitle("Checklist")
            .onAppear() {
                self.printChecklistContents() }
        }
    }
    
    func printChecklistContents() {
        for item in checklistItems {
            print(item)
        }
    }
}

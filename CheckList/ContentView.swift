//
//  ContentView.swift
//  CheckList
//
//  Created by zaid on 2/23/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import SwiftUI

struct ChecklistItem {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    /*
     Clean up...
     
     */
    
      // Properties
      // ==========
      @State var checklistItems = [
        ChecklistItem(name: "Walk the dog", isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
      ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self.id) { checklistItem in HStack {
                    Text(checklistItem.name)
                    Spacer()
                    Text(checklistItem.isChecked ? "✅" :"◻️")
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist") .onAppear() {
                self.printChecklistContents() }
        }
    }
    
    //Methods
    func printChecklistContents() {
        for item in checklistItems {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int){
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
}

//
//  ContentView.swift
//  CheckList
//
//  Created by zaid on 2/23/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import SwiftUI

struct ChecklistItem {
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    /*
     The id parameter of ForEach tells SwiftUI how to identify each element
     in the data provided to it, which in this case is checklistItems.
     When checklistItems was an array of strings, we told ForEach to simply use
     the value of the string as a way of distinguishing one element from another,
     and it worked.
     Now that checklistItems is an array of ChecklistItem instances,
     \.self refers to a whole ChecklistItem instance, which is a blob of data.
     
     */
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self.name) { checklistItem in HStack {
                    Text(checklistItem.name)
                    Spacer()
                    if checklistItem.isChecked {
                        Text("✅") } else {
                        Text("◻️")} }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist") .onAppear() {
                self.printChecklistContents() }
        }
    }
    
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

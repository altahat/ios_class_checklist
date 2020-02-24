//
//  ContentView.swift
//  CheckList
//
//  Created by zaid on 2/23/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import SwiftUI

struct ChecklistItem: Identifiable{
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    /*
     Let's have two items with the same name: "Walk the dog"
     Set isChecked to tue for the first one.
     Why the  second one checked?
     Answer:
     the ForEach identifies items using the property name.
     It always matches the first one itfinds.
     
     Fix: add a unique ID.
     
     */
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog", isChecked: true),
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self.id) { checklistItem in HStack {
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

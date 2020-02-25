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
     
     Make the whole line clickable.
     
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
                ForEach(checklistItems) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" :"◻️")
                    }
                    /*
                     list rows are transparent.  The white color is from the parent
                     view. The standard for most user
                     interfaces — not just iOS’ — is that transparent objects
                     aren’t tappable or clickable. Giving the row a color means
                     that its pixels are clickable, and giving it the same
                     color as the background view makes the whole under interface seamless.
                     */
                    .background(Color.white) // This makes the entire row clickable
                    .onTapGesture {
                        if let matchingIndex = self.checklistItems.firstIndex(where: {
                            $0.id == checklistItem.id }) {
                            self.checklistItems[matchingIndex].isChecked.toggle() }
                        self.printChecklistContents()
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

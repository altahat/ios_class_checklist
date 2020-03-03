//
//  ContentView.swift
//  CheckList
//
//  Created by zaid on 2/23/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import SwiftUI



struct ChecklistView: View {
    /*
     Refactor...
     Switch to #105
     */
    
    // Properties
    // ==========
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" :"◻️")
                    }
                        .background(Color.white) // This makes the entire row clickable
                        .onTapGesture {
                            if let matchingIndex = self.checklist.items.firstIndex(where: {
                                $0.id == checklistItem.id }) {
                                self.checklist.items[matchingIndex].isChecked.toggle() }
                            
                    }
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
        }
    }
    
    //Methods
    
}

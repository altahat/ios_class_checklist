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
     
     */
    
    // Properties
    // ==========
    @ObservedObject var checklist = Checklist()
    
    @State var newChecklistItemViewIsVisible = false
    
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
            .navigationBarItems(
                leading: Button(action: {
                    self.newChecklistItemViewIsVisible = true
                    print ("+ is clicked")
                })
                {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }
                }
                
                ,
                trailing: EditButton()
            )
                .navigationBarTitle("Checklist", displayMode: .inline)
        }
         .sheet(isPresented: $newChecklistItemViewIsVisible) {
          NewChecklistItemView(checklist: self.checklist)
        }
    }
    
    //Methods
    
}

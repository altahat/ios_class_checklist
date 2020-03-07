//
//  NewChecklistItemView.swift
//  CheckList
//
//  Created by zaid on 3/7/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    @State var newItemName = ""
    var checklist: Checklist
    
    var body: some View {
        VStack {
            Text("Add new item")
            Form {
                TextField("Enter new item name here", text: $newItemName)
                Button(action: {
                    let newChecklistItem = ChecklistItem(name: self.newItemName)
                    self.checklist.items.append(newChecklistItem)
                    self.checklist.printChecklistContents()
                }) { HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add new item")
                    }
                } }
            Text("Swipe down to cancel.") }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}

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
    /*
     @Environment marks a property as one that can access a specific system setting related
     to the operating system environment, hence the name. It lets you find useful settings,
     such as whether the user’s language is left-to-right or right-to-left,
     which calendar system is appropriate for the user’s locale settings,
     the current color scheme and other system-wide settings.
     */
    @Environment(\.presentationMode) var presentationMode
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
                    self.presentationMode.wrappedValue.dismiss()
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

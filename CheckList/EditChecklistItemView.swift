//
//  EditChecklistItemView.swift
//  CheckList
//
//  Created by zaid on 3/2/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import SwiftUI

struct EditChecklistItemView: View {
    // Properties
    // ==========
    /*
     @Binding properties
     a way to pass a connection to a checklist item rather than a copy.
     As a @State property, checklistItem was a property that belonged to EditChecklistItemView.
     With @State a copy of ChecklistItem is passed to EditCheclistItemView by RowView.
     Any changes made to the checklist item in EditChecklistItemView aren’t reflected
     in the matching checklist item in RowView
     
     As a @Binding property, checklistItem is a connection to another object’s property.
     Now, when a RowView instance passes a checklist item to an EditChecklistItemView
     via the checklistItem item property, any changes made to the checklist item
     in EditChecklistItemView will be reflected in the matching checklist item in RowView.
     */
    @Binding var checklistItem: ChecklistItem
    // User interface content and layout
    var body: some View {
        Form {
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        }
    }
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        /*
         the .constant function creates a binding to a checklist item,
         which is the kind of value that the checklistItem property expects.
         */
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}

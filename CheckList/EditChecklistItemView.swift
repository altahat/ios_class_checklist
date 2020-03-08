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
    @State var checklistItem: ChecklistItem
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
        EditChecklistItemView(checklistItem: ChecklistItem(name: "Sample item"))
    }
}

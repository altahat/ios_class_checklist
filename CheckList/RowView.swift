//
//  RowView.swift
//  CheckList
//
//  Created by zaid on 3/7/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @State var checklistItem: ChecklistItem
    var body: some View {        
        NavigationLink(destination: EditChecklistItemView()) {
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "✅" : "◻️") }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: ChecklistItem(name: "Sample item"))
    }
}

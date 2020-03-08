//
//  ChecklistItem.swift
//  CheckList
//
//  Created by zaid on 3/2/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable, Codable{
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}

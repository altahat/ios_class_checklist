//
//  Checklist.swift
//  CheckList
//
//  Created by zaid on 3/2/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import Foundation

/*
 In the MVVM pattern, the view observes the ViewModel.
 This observer/observed relationship binds the view and
 ViewModel so that when data that’s displayed to the user
 is updated in the ViewModel, the view updates itself automatically.
 
 The ViewModel should contain all the functionality that the view needs to
 present information to the user.
 
 So far, that functionality is:
 1. Displaying the checklist items.
 2. Deleting an item.
 3. Moving an item.
 4. Toggling an item between “checked” and “unchecked”.
 
 */

class Checklist: ObservableObject {
    //@Published means making changes to that property notifies any observing objects
    @Published var items = [
        ChecklistItem(name: "Walk the dog", isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
    
    init() {
        print("Documents directory is: \(documentsDirectory())")
        print("Data file path is: \(dataFilePath())")
    }
    
    func printChecklistContents() {
        for item in items {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int){
        items.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
    
    /*
     URL as a “web address”, but it’s really just a path for a given directory or file,
     which can be either online or on the local system.
     iOS uses URLs to refer to files in its file system.
     When a URL begins with http:// or https://, it refers to a directory or
     file on the web. When it refers to a local file, a URL will begin with file://.
     */
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory,
                                             in: .userDomainMask)
        return paths[0]
    }
    func dataFilePath() -> URL {
        return  documentsDirectory().appendingPathComponent("Checklist.plist") }
}

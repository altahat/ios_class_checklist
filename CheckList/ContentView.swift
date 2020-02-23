//
//  ContentView.swift
//  CheckList
//
//  Created by zaid on 2/23/20.
//  Copyright © 2020 UW Parkside. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            /*
             We all got lots to do. UP TO A LIMIT
             Why  are we gettint an error?
             You’ve just run into a big limit of working with Views:
             They’re limited to holding a maximum of ten Views.
             */
            List {
                Section(
                header: Text("High priority")) {
                    Text("Walk the dog")
                    Text("Brush my teeth")
                    Text("Learn iOS development")
                    Text("Make dinner")
                    Text("Do laundry")
                    Text("Pay bills")
                    Text("Finish homework")
                    Text("Change internet provider")
                    Text("Read Raywenderlich.com")
                    Text("Clean the kitchen")
                    Text("Wash the car")
                }
                Section(
                header: Text("Low priority")) {
                    Text("Soccer practice")
                    Text("Eat ice cream")
                    Text("Take vocal lessons")
                    Text("Record hit single")
                    Text("Learn every martial art")
                    Text("Design costume")
                    Text("Design crime-fighting vehicle")
                    Text("Come up with superhero name")
                    Text("Befriend space raccoon")
                    Text("Save the world")
                } }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Checklist")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

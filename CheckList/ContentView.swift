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
             In a static list, the simplest way to get around this limitation
             is to use a Group Its sole purpose is to provide a way for you to
             treat a group of two to ten views as a single view.
             Now Error gone with 11 views
             Fix it by using Group
             */
            List {
                Section(
                header: Text("High priority")) {
                    Group {
                        Text("Walk the dog")
                        Text("Brush my teeth")
                        Text("Learn iOS development")
                        Text("Make dinner")
                        Text("Do laundry")
                        Text("Pay bills")
                    }
                    Group {
                        Text("Finish homework")
                        Text("Change internet provider")
                        Text("Read RayWenderlich.com")
                        Text("Clean the kitchen")
                        Text("Wash the car")
                    } }
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

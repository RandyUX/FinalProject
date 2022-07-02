//
//  PurposePicker.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

 import SwiftUI

 struct PurposePicker: View {
    var colors = ["Now", "Scheduled", "Recurring"]
       @State private var selectedColor = "Now"

    var body: some View {
        VStack {
                   Picker("Please choose a color", selection: $selectedColor) {
                       ForEach(colors, id: \.self) {
                           Text($0)
                       }
                   }
                   Text("You selected: \(selectedColor)")
        }
    }
 }
 struct PurposePicker_Previews: PreviewProvider {
    static var previews: some View {
        PurposePicker()
    }
 }

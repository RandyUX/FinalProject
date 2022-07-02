//
//  viewMethodModel.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

 import SwiftUI

// model..

 struct ViewMethodModel: Identifiable {
    var id = UUID().uuidString
    var title: String
    var timing: Date
    var cardColor: Color = Color(red: 0.6, green: 0.9, blue: 2.0)
    var turnedOn: Bool = true
    // type...
    var memberType: String = "Public"
    // members
    // is simply creating a empty array for member count
    var members: [String] = Array(repeating: "", count: 10)

 }

//
//  chooseMethodViewModel.swift
//  Project
//
//  Created by Randy on 23/06/22.
//

 import SwiftUI

 class ChooseMethodViewModel: ObservableObject {

    @Published var addNewMethod = false

    @Published var chooseMethod: [ViewMethodModel] = [
        // creating sample for creating card view...
        ViewMethodModel(title: R.string.localizable.useraccountPlaceholder(), timing: Date()),
        ViewMethodModel(title: R.string.localizable.useraccountPlaceholder(), timing: Date())
    ]
 }

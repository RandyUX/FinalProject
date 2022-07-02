//
//  FormChooseBankButton.swift
//  Project
//
//  Created by Randy on 27/06/22.
//

import Foundation

import SwiftUI

struct FormChooseBankButton: View {

    var placehold: String = ""
    // @Binding var sourceNavigation: String
    @State private var navigationSummary: String?
    @Binding var choose: String
    @State var isDisabled: Bool = true

    var body: some View {
        VStack(spacing: 10) {
            Button(action: {

            }) {
                TextField(placehold, text: $choose)
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(30))
                    .foregroundColor(.black)
                    .font(.headline)
                    .disabled(true)

            }

            // Spacer()
        }
        // .padding()
    }
}

// struct FromChooseBankButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FormChooseBankButton(choose: .constant(""))
//    }
// }

//
//  FormScreen.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

import SwiftUI
import Alamofire

struct FormScreen: View {

    var placeholder: String = ""

    @Binding var form: String
    var image: String = ""
    var body: some View {
        HStack(spacing: 10) {

            TextField(placeholder, text: $form)
                .font(.headline)

            Spacer()
            Image(systemName: image)
        }
        .padding()
        .background(Color.gray.opacity(0.2).cornerRadius(30))
        .foregroundColor(.black)
        // .padding()
    }
}

struct FormScreen_Previews: PreviewProvider {
    static var previews: some View {
        FormScreen(placeholder: "", form: .constant(""))
    }
}

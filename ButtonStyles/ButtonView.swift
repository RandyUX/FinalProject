//
//  ButtonView.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

import SwiftUI

struct ButtonView: View {
    var title: String = ""
    var action: () -> Void = {}
    var body: some View {
        Button(action: action, label: {
            Text(title).padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(50)
                .foregroundColor(.white)
                .font(.headline)
                .padding(.top, 15)
            }
        )// button
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}

//
//  componentMethod.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

 import SwiftUI

 struct ComponentMethod: View {

    @State var transferFast: String = ""
    @State var lightningFast: String = ""
    @State var superFast: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(transferFast)
                .font(.headline)
                .fontWeight(.black)
                .foregroundColor(.white)
            Text(lightningFast)
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(3)
            Text(superFast)
                .font(.caption)
                .foregroundColor(.white)

        }
    }
 }

 struct ComponentMethod_Previews: PreviewProvider {
    static var previews: some View {
        ComponentMethod()
    }
 }

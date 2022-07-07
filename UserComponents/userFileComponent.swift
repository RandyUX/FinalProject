//
//  userFileComponent.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

import SwiftUI

struct UserFileComponent: View {
    var fullname: String
    var banknamed: String
    var rekeningaccount: String

    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .frame(width: 55, height: 55)
                .background(.cyan)
                .clipShape(Circle())
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                Text(fullname)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text(banknamed)
                    .foregroundColor(.secondary)
                Text(rekeningaccount)
                    .foregroundColor(.secondary)
            }
        }
        Rectangle()
            .frame( height: 1)
            .foregroundColor(.secondary)
    }
}

//
//  userFileComponent.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

 import SwiftUI

 struct UserFileComponent: View {
//    @State var user: String = ""
//    @State var bank: String = ""
//    @State var noRek: String = ""
    @State var fullname: String = ""
    @State var banknamed: String = ""
    @State var rekeningaccount: String = ""

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

 struct UserFileComponent_Previews: PreviewProvider {
    static var previews: some View {
        UserFileComponent()
    }
 }

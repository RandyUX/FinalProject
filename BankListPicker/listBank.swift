//
//  listBank.swift
//  Project
//
//  Created by Randy on 27/06/22.
//

import Foundation
import SwiftUI
import AlamofireObjectMapper
import Alamofire

struct ListBank: View {

    @State private var bankIndex = 0
//     var listBank = ["CBA", "DIRIMAN", "RBI", "KDI", "CEHA", "DCD", "CBC", "DBD", "HSH", "kjgjhgkjg"]

    @State private var listBank = [Bank]()

    @State private var selectedList: String = ""
    // @Binding var showPick: String?

    private func loadData() {
        print("dhjsaffa")
        Alamofire.request("https://private-58e21d-bankrequest.apiary-mock.com/checkbank")
            .responseObject { ( response: DataResponse<ResponseBank>) in
                if let  listresp = response.result.value {
                    listBank = listresp.bankdata
                    print(listBank)
                }
            }
    }

    var body: some View {
        ZStack {
            TextField(R.string.localizable.choosebankPlaceholder(), text: $selectedList)
                .padding()
                .background(Color.gray.opacity(0.2).cornerRadius(30))
                .foregroundColor(.black)
                .font(.headline)
//                .disabled(true)

            Picker(R.string.localizable.choosebankPlaceholder(), selection: $selectedList) {
                ForEach(listBank, id: \.self) { list in
                    Text(list.bankname + "dfhdjhf")
                }
            }.onAppear(perform: loadData)

        }
    }
}

// struct Content_Previews: PreviewProvider {
//    static var previews: some View {
//        ListBank( list: "")
//    }
// }

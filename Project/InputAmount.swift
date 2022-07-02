//
//  InputAmount.swift
//  Project
//
//  Created by Randy on 30/06/22.
//

import SwiftUI

struct InputAmount: View {
    @Binding var getInfo: Users?
    var body: some View {
        ZStack {
            // renderStatusIcon()
            Color.cyan.opacity(0.4)
            VStack {

                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {

                        UserFileComponent(fullname: "YUMMY", banknamed: "ABC", rekeningaccount: "234-345-123")

                        VStack(alignment: .leading) {
                            ListSummary(
                                title: R.string.localizable.toaccountPlaceholder(),
                                subTitle: getInfo?.fullname ?? ""
                            )
                            ListSummary(
                                title: R.string.localizable.notesPlaceholder() ,
                                subTitle: getInfo?.notes ?? ""
                            )
                            ListSummary(
                                title: R.string.localizable.totalPlaceholder(),
                                subTitle: getInfo?.total ?? ""
                            )
                            ListSummary(
                                title: R.string.localizable.transactiontimePlaceholder(),
                                subTitle: getInfo?.transactiontime ?? ""
                            )
                        }
                        Rectangle()
                            .frame( height: 1)
                            .foregroundColor(.secondary)
                        HStack {
                            Text("Total").fontWeight(.bold)
                            Spacer()
                            Text("IDR 100,000").fontWeight(.bold)
                        }
                    }
                    .padding()
                    .padding(.vertical, 10)
                }
                .background(Color.white)
                .cornerRadius(20).padding()
                .shadow(radius: 30)
                // renderToInsertPin().padding(.horizontal, 40)
                // renderNavToInsertPin()

                Spacer()

            }
        }
    }
}

// struct InputAmount_Previews: PreviewProvider {
//    static var previews: some View {
//        InputAmount()
//    }
// }

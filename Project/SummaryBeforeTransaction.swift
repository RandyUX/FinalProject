//
//  SummaryBeforeTransaction.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

import SwiftUI
import FirebaseAnalytics
import FirebaseCore
import Alamofire

enum NextToInsertPin: String {
    case insertPin = "insertPin"
}

private func renderStatusIcon() -> some View {
    return LottieAnimations(lottieFile: "50820-blue-loading")
        .frame(width: 100, height: 100)
        .frame(maxWidth: .infinity)
        .foregroundColor(.blue)
        .listRowSeparator(.hidden)
}

struct SummaryBeforeTransaction: View {

    private func onLoad() {
        AnalyticsManager.log(AnalyticsTags.visitPin)
    }

    @State private var navigationToInsertPin: String?
    @Binding var sourceNavigation: String?

    func buttonToInsertPin() {
        navigationToInsertPin = NextToInsertPin.insertPin.rawValue
    }

    private func renderToInsertPin() -> some View {
        Button(action: buttonToInsertPin) {Text(R.string.localizable.confirmPlaceholder()).padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(100)
                .foregroundColor(.white)
                .font(.headline)
            .padding(.top, 10)}

    }

    private func renderNavToInsertPin() -> some View {
        NavigationLink(destination: PinTransaction(sourceNavigation: $sourceNavigation), tag: NextToInsertPin.insertPin.rawValue,
                       selection: $navigationToInsertPin) {EmptyView()}
    }

    @Binding var getInfo: Users?

    var body: some View {
        ZStack {
            renderStatusIcon()
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

                renderToInsertPin().padding(.horizontal, 40)

                renderNavToInsertPin()

                Spacer()

            }
        }
    }
}

//    struct SummaryBeforeTransaction_Previews: PreviewProvider {
//        //@State static var getText: String = ""
//        static var previews: some View {
//            SummaryBeforeTransaction()
//        }
//    }

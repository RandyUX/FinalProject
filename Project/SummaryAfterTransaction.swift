//
//  SummaryAfterTransaction.swift
//  Project
//
//  Created by Randy on 22/06/22.
//

import SwiftUI
import Lottie
import Alamofire
import FirebaseAnalytics

private func renderStatusIcon() -> some View {
    return LottieAnimations(lottieFile: "check-mark")
        .frame(width: 100, height: 100)
        .frame(maxWidth: .infinity)
        .foregroundColor(.blue)
        .listRowSeparator(.hidden)
}

enum ToHome: String {
    case addMoreTransferButton = "AddMoreTransfer"
    case homeButton = "HomeTransfer"
}

struct SummaryAfterTransaction: View {

    private func onLoad() {
        AnalyticsManager.log(AnalyticsTags.transferform)
    }

    @State private var recipients = [Recipient]()
    private func loadData() {

        guard let data = JsonReader.loadDataFrom(filename: "recipient") else {
            return
        }
        do {
            self.recipients = try JSONDecoder().decode([Recipient].self, from: data)
        } catch {
            //            print(error)
            return
        }

    }

    @Binding var sourceNavigation: String?

    @State private var navigationToHome: String?
    // @State private var navigationToHome: String?

    func tapButtonToAddMoreTransfer() {
        sourceNavigation = ToHome.addMoreTransferButton.rawValue
    }

    func tapToHome() {
        sourceNavigation = ToHome.homeButton.rawValue
        // print(chooseBank)

    }

    // render History User
    private func renderAddButton() -> some View {
        ButtonView(title: R.string.localizable.addmoretransferPlaceholder(), action: tapButtonToAddMoreTransfer)
    }

    // render Confirm User
    private func renderBackHomeButton() -> some View {
        ButtonView(title: R.string.localizable.backhomePlaceholder(), action: tapToHome)
    }

    // render History Link
    private func renderNavHome() -> some View {
        Group {
            NavigationLink(destination: ContentView(), tag: ToHome.addMoreTransferButton.rawValue, selection: $sourceNavigation) {EmptyView()}
            NavigationLink(destination: ContentView(), tag: ToHome.homeButton.rawValue, selection: $sourceNavigation ) {EmptyView()}
        }
    }

    // @Binding var getInfo: Users?

    var body: some View {

        ZStack {
            Color.cyan.opacity(0.4)
            VStack {
                VStack {

                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {

                            UserFileComponent(fullname: "YUMMY", banknamed: "ABC", rekeningaccount: "234-345-123")

                            VStack(alignment: .leading) {
                                ListSummary(
                                    title: R.string.localizable.toaccountPlaceholder(),
                                    subTitle: R.string.localizable.torekeningPlaceholder()
                                )
                                ListSummary(
                                    title: R.string.localizable.notesPlaceholder(),
                                    subTitle: R.string.localizable.notesPlaceholder()
                                    // getInfo?.notes ?? ""
                                )
                                ListSummary(
                                    title: R.string.localizable.totalPlaceholder(),
                                    subTitle: R.string.localizable.totalPlaceholder()
                                    // getInfo?.total ?? ""
                                )
                                ListSummary(
                                    title: R.string.localizable.transactiontimePlaceholder(),
                                    subTitle: R.string.localizable.transactiontimePlaceholder()
                                        // getInfo?.transactiontime ?? ""
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
//                    renderToInsertPin().padding(.horizontal, 40)
                    renderNavHome()
                    renderBackHomeButton().padding(.horizontal, 30)
                    Spacer()

            }
            }
        }
    }
}

//
// struct SummaryAfterTransaction_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryAfterTransaction()
//    }
// }

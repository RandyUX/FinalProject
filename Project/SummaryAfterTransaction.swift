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

    @Binding var sourceNavigation: String?

    @State private var navigationToHome: String?

    @State private var datauserResponse = [DataUser]()

    @State var account: DataUser?

    @Binding var getInfo: DataForm?

    @State private var recipients = [Recipient]()

    private func onLoad() {
        AnalyticsManager.log(AnalyticsTags.transferform)
    }

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

//    private func loadData() {
//        let URL = ("https://private-58e21d-bankrequest.apiary-mock.com/history")
//        Alamofire.request(URL).responseObject { (response: DataResponse<ResponseHistory>) in
//
//            let responsehistory = response.result.value
//            userResponse = responsehistory?.data ?? []
//            print(userResponse.first?.fullnamed)
//            filterData()
//        }
//    }

//    private func filterData() {
//        for user in userResponse {
//            if user.rekeningaccount == getInfo?.rekeningAccount {
//                account = user
//                print(account?.fullnamed)
//            }
//        }
//    }

    var body: some View {

        ZStack {

            Color.cyan.opacity(0.4)
            VStack {
                renderStatusIcon()
                VStack {

                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {

                            UserFileComponent(fullname: account?.fullnamed ?? "", banknamed: account?.banknamed ?? "", rekeningaccount: account?.rekeningaccount ?? "")

                            VStack(alignment: .leading) {
                                ListSummary(
                                    title: R.string.localizable.nameofbankPlaceholder(),
                                    subTitle: getInfo?.bank ?? ""
                                )
                                ListSummary(
                                    title: R.string.localizable.toaccountPlaceholder() ,
                                    subTitle: getInfo?.rekeningAccount ?? ""
                                )
                                ListSummary(
                                    title: R.string.localizable.notesPlaceholder(),
                                    subTitle: getInfo?.notes ?? ""
                                )
                                ListSummary(
                                    title: R.string.localizable.totalPlaceholder(),
                                    subTitle: getInfo?.total ?? ""
                                )

                            }
                            Rectangle()
                                .frame( height: 1)
                                .foregroundColor(.secondary)
                            HStack {
                                Text(R.string.localizable.totalPlaceholder()).fontWeight(.bold)
                                Spacer()
                                Text("IDR " + getInfo!.total).fontWeight(.bold)
                            }
                        }
                        .padding()
                        .padding(.vertical, 10)
                        .onAppear(perform: loadData)
                    }
                    .background(Color.white)
                    .cornerRadius(20).padding()
                    .shadow(radius: 30)
                    renderNavHome()
                    renderBackHomeButton().padding(.horizontal, 30)
                    Spacer()

                }
            }
        }.navigationBarTitle(R.string.localizable.transferstatusPlaceholder(), displayMode: .inline)
    }
}

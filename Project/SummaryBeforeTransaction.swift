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

    @State private var navigationToInsertPin: String?

    @Binding var sourceNavigation: String?

    @State var account: DataUser?

    @State private var userResponse = [DataUser]()

    @Binding var getInfo: DataForm?

    private func onLoad() {
        AnalyticsManager.log(AnalyticsTags.visitPin)
    }

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
        NavigationLink(destination: PinTransaction(sourceNavigation: $sourceNavigation, getInfo: $getInfo), tag: NextToInsertPin.insertPin.rawValue,
                       selection: $navigationToInsertPin) {EmptyView()}
    }

    private func loadData() {
        let URL = ("https://private-58e21d-bankrequest.apiary-mock.com/user")
        Alamofire.request(URL).responseObject { (response: DataResponse<ResponseDataUser>) in

            let responsedatauser = response.result.value
            userResponse = responsedatauser?.data ?? []
            print(userResponse.first?.fullnamed)
            filterData()

        }
    }

    private func filterData() {
        for user in userResponse {
            if user.rekeningaccount == getInfo?.rekeningAccount {
                account = user
                print(account?.fullnamed)
            }
        }
    }

    var body: some View {
        ZStack {

            Color.cyan.opacity(0.4)
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
                            Text(getInfo?.total ?? "").fontWeight(.bold)
                        }

                    }
                    .padding()
                    .padding(.vertical, 10)
                    .onAppear(perform: loadData)

                }
                .background(Color.white)
                .cornerRadius(20).padding()
                .shadow(radius: 30)

                renderToInsertPin().padding(.horizontal, 40)

                renderNavToInsertPin()
                renderStatusIcon()

                Spacer()

            }.navigationBarTitle(R.string.localizable.yourconfirmationtransferPlaceholder(), displayMode: .inline)
        }
    }
}

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
        .frame(width: 200, height: 200)
        .foregroundColor(.blue)
        .listRowSeparator(.hidden)
        .padding(.top, 20)
        .cornerRadius(20)
        .padding([.trailing, .leading], 20)
}

enum ToHome: String {
    case addMoreTransferButton = "Back to Transfer"// "AddMoreTransfer"
    case homeButton = "HomeTransfer"
}

struct SummaryAfterTransaction: View {

    @Binding var sourceNavigation: String?

    @Binding var getInfo: DataForm?

    @StateObject var viewModelSummary: SummaryAfterTransactionViewModel = SummaryAfterTransactionViewModel()

    // render History User
    private func renderAddButton() -> some View {
        ButtonView(title: R.string.localizable.backhomePlaceholder(), action: {viewModelSummary.tapButtonToAddMoreTransfer(buttonAddMore: viewModelSummary.sourceNavigation ?? "")})

    }

    // render Confirm User
    private func renderBackHomeButton() -> some View {
        ButtonView(title: R.string.localizable.backhomePlaceholder(), action: {
            sourceNavigation = ""
        })
    }

    // render History Link
    private func renderNavHome() -> some View {
        Group {
            NavigationLink(destination: ContentView(), tag: ToHome.addMoreTransferButton.rawValue, selection: $sourceNavigation) {EmptyView()}
            NavigationLink(destination: ContentView(), tag: ToHome.homeButton.rawValue, selection: $sourceNavigation ) {EmptyView()}
        }
    }

    var body: some View {

        ZStack {

            VStack {

                VStack {
                    renderStatusIcon()
                    Text("Transfer Success")
                    renderNavHome()
                        .padding(.bottom)
                    // renderBackHomeButton()
                    renderBackHomeButton()
                    .padding(.horizontal, 30)

                }
            }
        }.navigationBarTitle(R.string.localizable.transferstatusPlaceholder(), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
    }
}

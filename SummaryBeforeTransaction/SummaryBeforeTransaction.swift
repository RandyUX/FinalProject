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

    @Binding var sourceNavigation: String?
    @State  var navigationToInsertPin: String?

    @ObservedObject var viewModel: SummaryBeforeTransactionModel

    // @Binding var getInfo: DataForm?

    private func renderToInsertPin() -> some View {
        Button(action: viewModel.buttonToInsertPin) {Text(R.string.localizable.confirmPlaceholder()).padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(100)
                .foregroundColor(.white)
                .font(.headline)
            .padding(.top, 10)}

    }
    //    func buttonToInsertPin() {
    //        navigationToInsertPin = NextToInsertPin.insertPin.rawValue
    //    }

    private func renderNavToInsertPin() -> some View {
        NavigationLink(destination: PinTransaction(sourceNavigation: $sourceNavigation,
                                                   getInfo: $viewModel.getInfo),
                       tag: NextToInsertPin.insertPin.rawValue,
                       selection: $viewModel.navigationToInsertPin) {EmptyView()}
    }

    var body: some View {
        ZStack {

            Color.cyan.opacity(0.4)
            VStack {

                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {

                        UserFileComponent(fullname: viewModel.confirmSummary.datauser.fullnamed,
                                          banknamed: viewModel.confirmSummary.datauser.banknamed,
                                          rekeningaccount: viewModel.confirmSummary.datauser.rekeningaccount)

                        VStack(alignment: .leading) {
                            ListSummary(
                                title: R.string.localizable.nameofbankPlaceholder(),
                                subTitle: viewModel.confirmSummary.listbank.bankname
                            )
                            ListSummary(
                                title: R.string.localizable.toaccountPlaceholder() ,
                                subTitle: viewModel.confirmSummary.datauser.rekeningaccount
                            )
                            ListSummary(
                                title: R.string.localizable.notesPlaceholder(),
                                subTitle: viewModel.confirmSummary.notes
                            )
                            ListSummary(
                                title: R.string.localizable.totalPlaceholder(),
                                subTitle: String(viewModel.confirmSummary.total)
                            )
                        }
                        Rectangle()
                            .frame( height: 1)
                            .foregroundColor(.secondary)

                        HStack {
                            Text(R.string.localizable.totalPlaceholder()).fontWeight(.bold)
                            Spacer()
                            Text(String(viewModel.confirmSummary.total)).fontWeight(.bold)
                        }

                    }
                    .padding()
                    .padding(.vertical, 10)
                    .onAppear {
                        viewModel.loadData(getInfo: viewModel.getInfo ?? DataForm())
                    }

                }
                .background(Color.white)
                .cornerRadius(20).padding()
                .shadow(radius: 30)

                renderToInsertPin().padding(.horizontal, 40)

                renderNavToInsertPin()
                renderStatusIcon()

            }.navigationBarTitle(R.string.localizable.yourconfirmationtransferPlaceholder(), displayMode: .inline)
        }
    }
}

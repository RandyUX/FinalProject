//
//  ContentView.swift
//  Project
//
//  Created by Randy on 20/06/22.
//

import SwiftUI
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import FirebaseCore
import FirebaseAnalytics
import Rswift

enum NextPage: String {
    case confirmUser = "ConfirmUser"
    case confirmHistoryUser = "ConfirmHistoryUser"
}

private func renderStatusIcon() -> some View {
    return LottieAnimations(lottieFile: "50820-blue-loading")
        .frame(width: 100, height: 100)
        .frame(maxWidth: .infinity)
        .foregroundColor(.blue)
        .listRowSeparator(.hidden)
}

struct ContentView: View {

    @StateObject var contentViewModel = ContentViewModel()

    // render History User
    private func renderHistoryButton() -> some View {
        ButtonView(title: R.string.localizable.historyPlaceholder(), action: contentViewModel.tapButtonToConfirmUser)
    }

    // render History Link
    private func renderNavLink() -> some View {
        Group {
            NavigationLink(
                destination: ConfirmUser(navigationSource: $contentViewModel.navigationSelection),
                tag: NextPage.confirmHistoryUser.rawValue,
                selection: $contentViewModel.navigationSelection) {EmptyView()}

            NavigationLink(
                destination: SummaryBeforeTransaction(
                    sourceNavigation: $contentViewModel.navigationSelection,
                    viewModel: SummaryBeforeTransactionModel(
                        confirmSummary: contentViewModel.confirmSummary ?? ConfirmSummary()
                    )
                ),
                tag: NextPage.confirmUser.rawValue,
                selection: $contentViewModel.navigationSelection ) {EmptyView()}

        }
    }

    // render Confirm User
    private func renderConfirmButton() -> some View {
        ButtonView(title: R.string.localizable.continuePlaceholder(), action: contentViewModel.tapToChooseMethod)
    }

    var body: some View {

        NavigationView {
            ZStack {
                Color.blue.opacity(0.3)
                renderStatusIcon()
                VStack {

                    VStack {

                        VStack {

                            FormScreen(
                                placeholder:
                                    R.string.localizable.choosebankPlaceholder(),
                                form: $contentViewModel.selectedBank,
                                image: "chevron.right").disabled(true)
                                .onTapGesture {
                                    contentViewModel.isPresent.toggle()

                                }.sheet(isPresented: $contentViewModel.isPresent) {
                                    ModalView(selectedBank: $contentViewModel.selectedBank, selectedBankId: $contentViewModel.selectedBankId, isPresent: $contentViewModel.isPresent)
                                }

                            FormScreen(placeholder: R.string.localizable.torekeningaccountPlaceholder(), form: $contentViewModel.rekeningaccount)

                            FormScreen(placeholder: R.string.localizable.notesPlaceholder(), form: $contentViewModel.notes)

                            FormScreen(placeholder: R.string.localizable.totalPlaceholder(), form: $contentViewModel.total)

                            renderNavLink()

                            renderHistoryButton()

                            renderConfirmButton()

                        }.padding()

                    }
                    .background(.white)
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
                    .shadow(radius: 60)

                }

            }
            .navigationBarTitle(R.string.localizable.transferPlaceholder(), displayMode: .inline)
            //                .onAppear(perform: loadData)

        }
    }

    struct ModalView: View {
        // @State private var bankresponses = [Bank]()
        @Binding var selectedBank: String
        @Binding var selectedBankId: Int
        @Binding  var isPresent: Bool
        @StateObject var contentViewModel = ContentViewModel()

        var body: some View {

            VStack(alignment: .leading) {

                Text("List Bank").font(.title).padding(.bottom, 20)

                ForEach(contentViewModel.bankrespons, id: \.self) { list in

                    Text(list.bankname)
                        .onTapGesture {
                            self.selectedBank = list.bankname
                            self.selectedBankId = list.id
                            self.isPresent = false
                            print(selectedBank)
                        }
                    Rectangle()
                        .frame( height: 1)
                        .foregroundColor(.secondary)
                }

            }
            .padding(.leading, 10)

            Spacer()

                .padding(.horizontal, 20)
                .padding(.top, 20)
                .onAppear(perform: contentViewModel.loadData)
        }
    }
}

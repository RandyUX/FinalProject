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

    @State private var bankresponses = [Bank]()

    @State private var navigationSelection: String?
    @State private var navigationColor: String?

    @State var id: Int = 0
    @State var fullname: String = ""
    @State var banknamed: String = ""
    @State var rekeningaccount: String = ""
    @State var transfermethod: String = ""
    @State var notes: String = ""
    @State var total: String = ""
    @State var transactiontime: String = ""

    //    @State var chooseBank: String = ""
    //    @State var fromAccount: String = ""
    //    @State var toAccount: String = ""
    //    @State var notes: String = ""
    //    @State var inputAmount: String = ""
    //    @State var userConfirm: Bool = false

    @State var form: Users?
    //    @Binding var navigationSource: String?
    private func onLoad() {
        AnalyticsManager.log(AnalyticsTags.visitConfirmationSummary)
    }

    func tapButtonToConfirmUser() {
        // navigationSelection = NextPage.ConfirmUser.rawValue
        navigationSelection = NextPage.confirmHistoryUser.rawValue
    }

    func tapToChooseMethod() {
        form = Users(id: id, fullname: fullname, banknamed: banknamed, rekeningaccount: rekeningaccount, transfermethod: transfermethod, notes: notes, total: total, transactiontime: transactiontime)
        navigationSelection = NextPage.confirmUser.rawValue
        print(banknamed)
        onLoad()
    }

    // render History User
    private func renderHistoryButton() -> some View {
        ButtonView(title: R.string.localizable.historyPlaceholder(), action: tapButtonToConfirmUser)
    }

    // render History Link
    private func renderNavLink() -> some View {
        Group {
            NavigationLink(
                destination: ConfirmUser(navigationSource: $navigationSelection),
                tag: NextPage.confirmHistoryUser.rawValue,
                selection: $navigationSelection) { EmptyView()}

            NavigationLink(
                destination: SummaryBeforeTransaction(sourceNavigation: $navigationSelection, getInfo: $form),
                tag: NextPage.confirmUser.rawValue,
                selection: $navigationSelection ) {EmptyView()}
            // SummaryBeforeTransaction(getInfo: $form)
            //            SummaryBeforeTransaction(
            //                sourceNavigation: $navigationSelection,
            //                getInfo: $form)
            //            MethodView(sourceNavigation: $navigationSelection)
        }
    }

    // render Confirm User
    private func renderConfirmButton() -> some View {
        ButtonView(title: R.string.localizable.continuePlaceholder(), action: tapToChooseMethod)
    }

    // call analytics
    @State private var bankIndex = 0
    // log event
    func fetchAnalytics() {
        Analytics.logEvent("getdatabank", parameters: [
            "Id-1": "asdfasdfasdf",
            "namebank": R.string.localizable.continuePlaceholder()
        ])
    }

    //  private func loadData() { Alamofire.request("https://private-58e21d-bankrequest.apiary-mock.com/checkbank").response { response in
    //            debugPrint(response)
    //        }
    // }
    @State private var isPresent: Bool = false
    @State private var selectedBank: String = ""
    var body: some View {

        NavigationView {
            ZStack {
                Color.blue.opacity(0.3)
                renderStatusIcon()
                VStack {

                    VStack {

                        VStack {

                            FormScreen(placeholder: R.string.localizable.choosebankPlaceholder(), form: $selectedBank, image: "chevron.right").disabled(true)
                                .onTapGesture {
                                    isPresent.toggle()

                                }.sheet(isPresented: $isPresent) {
                                    ModalView(selectedBank: $selectedBank, isPresent: $isPresent)
                                }

                            FormScreen(placeholder: R.string.localizable.torekeningaccountPlaceholder(), form: $rekeningaccount)

                            FormScreen(placeholder: R.string.localizable.notesPlaceholder(), form: $notes)

                            FormScreen(placeholder: R.string.localizable.totalPlaceholder(), form: $total)

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
        @State private var bankresponses = [Bank]()
        @Binding var selectedBank: String
        @Binding  var isPresent: Bool
        // call Api
        private func loadData() {
            Alamofire.request(Server.url+"/checkbank")
                .responseObject { ( response: DataResponse<ResponseBank>) in
                    if let bankResponse = response.result.value {
                        bankresponses = bankResponse.bankdata
                    }
                }
        }

        var body: some View {

            VStack(alignment: .leading) {
                Text("List Bank").font(.title).padding(.bottom, 20)

                ForEach(bankresponses, id: \.self) { list in

                    Text(list.bankname)
                        .onTapGesture {
                            self.selectedBank = list.bankname
                            self.isPresent = false
                            print(selectedBank)
                        }
                    Rectangle()
                        .frame( height: 1)
                        .foregroundColor(.secondary)
                }

            }

            Spacer()

                .padding(.horizontal, 20)
                .padding(.top, 20)
                .onAppear(perform: loadData)
        }
    }
    // struct ContentView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        ContentView()
    //    }
    // }
}

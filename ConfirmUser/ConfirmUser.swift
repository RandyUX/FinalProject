//
//  ConfirmUser.swift
//  Project
//
//  Created by Randy on 20/06/22.
//

import SwiftUI
import FirebaseAnalytics
import Alamofire

enum NextChooseMethod: String {
    case userValid = "nextChooseMethod"
}

private func renderStatusIcon() -> some View {
    return LottieAnimations(lottieFile: "50820-blue-loading")
        .frame(width: 100, height: 100)
        .frame(maxWidth: .infinity)
        .foregroundColor(.blue)
        .listRowSeparator(.hidden)
}

struct ConfirmUser: View {

    // @State private var navigationChooseMethod: String?

    @Binding var navigationSource: String?

    @StateObject var confirmUserModel = ConfirmUserModel()
    // @Binding var getInfo: DataForm?

    private func renderToMethod() -> some View {
        Button(action: confirmUserModel.buttonToMethod) {Text(R.string.localizable.continuePlaceholder()).padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(100)
                .foregroundColor(.white)
                .font(.headline)
            .padding(.top, 100)}
    }

    private func renderNavMethod() -> some View {
        NavigationLink(destination: PinTransaction(sourceNavigation: $navigationSource, getInfo: $confirmUserModel.getInfo), tag: NextChooseMethod.userValid.rawValue,
                       selection: $confirmUserModel.navigationChooseMethod) {EmptyView()}
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(alignment: .leading) {
                renderStatusIcon()
                ForEach(confirmUserModel.historyResponse) { data in
                    UserFileComponent(fullname: data.fullnamed, banknamed: data.banknamed, rekeningaccount: data.rekeningaccount)
                }

            }.padding()
                .onAppear(perform: confirmUserModel.loadData)
        }
        .navigationBarTitle(R.string.localizable.historyPlaceholder(), displayMode: .inline)
    }
}

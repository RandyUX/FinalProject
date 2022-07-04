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

    @State private var navigationChooseMethod: String?

    @Binding var navigationSource: String?

    @State private var historyResponse = [History]()

    func buttonToMethod() {
        navigationChooseMethod = NextChooseMethod.userValid.rawValue
    }

    private func renderToMethod() -> some View {
        Button(action: buttonToMethod) {Text(R.string.localizable.continuePlaceholder()).padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(100)
                .foregroundColor(.white)
                .font(.headline)
            .padding(.top, 100)}
    }

    private func renderNavMethod() -> some View {
        NavigationLink(destination: MethodView(sourceNavigation: $navigationSource), tag: NextChooseMethod.userValid.rawValue,
                       selection: $navigationChooseMethod) {EmptyView()}
    }
    //
    private func loadData() {
        let URL = ("https://private-58e21d-bankrequest.apiary-mock.com/history")
        Alamofire.request(URL).responseObject { (response: DataResponse<ResponseHistory>) in

            let responsehistory = response.result.value
            historyResponse = responsehistory?.data ?? []
            print(historyResponse.first?.fullnamed)
        }
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(alignment: .leading) {
                renderStatusIcon()
                ForEach(historyResponse) { data in
                    UserFileComponent(fullname: data.fullnamed, banknamed: data.banknamed, rekeningaccount: data.rekeningaccount)
                }

            }.padding()
                .onAppear(perform: loadData)
        }
        .navigationBarTitle(R.string.localizable.historyPlaceholder(), displayMode: .inline)
    }
}

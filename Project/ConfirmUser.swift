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

    @State private var userResponses = [Users]()

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
        Alamofire.request("https://private-58e21d-bankrequest.apiary-mock.com/questions")
            .responseObject { ( response: DataResponse<ResponseUserAccount>) in
                if let userResponse = response.result.value {
                    userResponses = userResponse.useraccount
                }
            }
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(alignment: .leading) {
                renderStatusIcon()
                UserFileComponent(fullname: "Asta", banknamed: "IRB", rekeningaccount: "343-232-567")
                UserFileComponent(fullname: "Sutejo", banknamed: "INB", rekeningaccount: "343-456-789")
                UserFileComponent(fullname: "Sukiman", banknamed: "CBA", rekeningaccount: "343-678-890")
                UserFileComponent(fullname: "Sukidi", banknamed: "TBI", rekeningaccount: "343-678-891")
                UserFileComponent(fullname: "Sukiem", banknamed: "HBE", rekeningaccount: "343-676-894")
                UserFileComponent(fullname: "manteman", banknamed: "ABO", rekeningaccount: "343-673-893")
                UserFileComponent(fullname: "Tukidi", banknamed: "OBE", rekeningaccount: "343-671-894")
                UserFileComponent(fullname: "Sumanto", banknamed: "HBI", rekeningaccount: "342-672-892")
                UserFileComponent(fullname: "Boboho", banknamed: "NBC", rekeningaccount: "341-673-898")
            }.padding()
        }
        .navigationBarTitle("History", displayMode: .inline)

        //        VStack {
        //            renderNavMethod()
        //            renderToMethod()
        //                .padding()
        //        }
    }
}

// struct ConfirmUser_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmUser()
//    }
// }

//
//  TransferViewModel.swift
//  Project
//
//  Created by Randy on 05/07/22.
//

import Foundation
import Alamofire

class ContentViewModel: ObservableObject {
    @Published var bankrespons = [Bank]()

    @Published var navigationSelection: String?

    @Published var navigationColor: String?

    @Published var id: Int = 0

    @Published var selectedBankId: Int = DefaultValue.emptyValue

    @Published var fullname: String = DefaultValue.emptyString

    @Published var banknamed: String = DefaultValue.emptyString

    @Published var rekeningaccount: String = ""

    @Published var notes: String = ""

    @Published var total: String = ""

    @Published  var selectedBank: String = ""

    @Published var form: DataForm?

    @Published var isPresent: Bool = false

    @Published var confirmSummary: ConfirmSummary? = ConfirmSummary()

    func loadData() {
        Alamofire.request(Server.url+"/checkbank")
            .responseObject { [self] ( response: DataResponse<ResponseBank>) in
                if let bankResponse = response.result.value {
                    self.bankrespons = bankResponse.bankdata
                }
            }
    }

    func tapButtonToConfirmUser() {
        // navigationSelection = NextPage.ConfirmUser.rawValue
        navigationSelection = NextPage.confirmHistoryUser.rawValue
    }

    func tapToChooseMethod() {
        // form = DataForm(bank: selectedBank, rekeningAccount: rekeningaccount, notes: notes, total: total)
        let parameters: [String: Any] = ["banknamed": selectedBank,
                                         "rekeningAccount": rekeningaccount,
                                         "notes": notes,
                                         "Total": total]
        createData(parameters: parameters)
        navigationSelection = NextPage.confirmUser.rawValue
        print(banknamed)
        // onLoad()
    }

    func createData(parameters: [String: Any]) {

        Alamofire.request(

            Server.url+"/confirmFill",

            method: .post,

            parameters: parameters,

            encoding: JSONEncoding.default

        )

        .responseObject {( response: DataResponse<ResponseSummary>) in

            switch response.result {

            case .success:

                guard let resp = response.value else {

                    return

                }

                self.confirmSummary = resp.data

                //       print("sukkses \(self.confirmSummary)")

            case let .failure(error):

                print(error)

            }

        }

    }

}

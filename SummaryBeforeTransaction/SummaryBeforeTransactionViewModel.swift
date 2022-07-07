//
//  SummaryBeforeTransactionModel.swift
//  Project
//
//  Created by Randy on 05/07/22.
//

import Foundation
import Alamofire

class SummaryBeforeTransactionModel: ObservableObject {

    @Published var confirmSummary: ConfirmSummary = ConfirmSummary()

    var account: DataUser?

    var userResponse = [DataUser]()

    var getInfo: DataForm?

   @Published var navigationToInsertPin: String?

    init(confirmSummary: ConfirmSummary) {
        self.confirmSummary = confirmSummary
    }

    private func onLoad() {
        AnalyticsManager.log(AnalyticsTags.visitPin)
    }

    func buttonToInsertPin() {
        navigationToInsertPin = NextToInsertPin.insertPin.rawValue
    }

    func loadData(getInfo: DataForm) {
        let URL = ("https://private-58e21d-bankrequest.apiary-mock.com/user")
        Alamofire.request(URL).responseObject { (response: DataResponse<ResponseDataUser>) in

            let responsedatauser = response.result.value
            self.userResponse = responsedatauser?.data ?? []
            print(self.userResponse.first?.fullnamed)
            self.filterData(getInfo: getInfo)
            print(self.userResponse.first)

        }
    }

    func filterData(getInfo: DataForm) {
        for user in userResponse {
            if user.rekeningaccount == getInfo.rekeningAccount {
                account = user
               // print("filterData")
                print(account?.fullnamed)
                // print(user.fullnamed)
            }
        }
    }

}

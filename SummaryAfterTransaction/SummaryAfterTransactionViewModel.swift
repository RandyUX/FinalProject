//
//  SummaryAfterTransactionViewModel.swift
//  Project
//
//  Created by Randy on 05/07/22.
//

import Foundation
import Alamofire

class SummaryAfterTransactionViewModel: ObservableObject {
    @Published private var recipients = [Recipient]()

    @Published private var navigationToHome: String?

   // @Published private var datauserResponse = [DataUser]()

    @Published var account: DataUser?

    @Published private var userResponse = [DataUser]()

    @Published var getInfo: DataForm?

    @Published var sourceNavigation: String?

    private func onLoad() {
        AnalyticsManager.log(AnalyticsTags.transferform)
    }

    func dataLoad(getInfo: DataForm) {
        let URL = ("https://private-58e21d-bankrequest.apiary-mock.com/user")
        Alamofire.request(URL).responseObject { (response: DataResponse<ResponseDataUser>) in

            let responsedatauser = response.result.value
            self.userResponse = responsedatauser?.data ?? []
            print(self.userResponse.first?.fullnamed)
            self.filterData(getInfo: getInfo)
           // self.filterData()

        }
    }

    func filterData(getInfo: DataForm) {
        for user in userResponse {
            if user.rekeningaccount == getInfo.rekeningAccount {
                account = user
                print(account?.fullnamed)
            }
        }
    }

    func tapButtonToAddMoreTransfer(buttonAddMore: String) {
        sourceNavigation = ToHome.addMoreTransferButton.rawValue
    }

    func tapToHome() {
        sourceNavigation = ToHome.homeButton.rawValue

    }

}

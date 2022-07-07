//
//  ConfirmUserModel.swift
//  Project
//
//  Created by Randy on 05/07/22.
//

import Foundation
import Alamofire

class ConfirmUserModel: ObservableObject {

    @Published var historyResponse = [History]()

    @Published var navigationChooseMethod: String?

    var getInfo: DataForm?

    func loadData() {
        let URL = ("https://private-58e21d-bankrequest.apiary-mock.com/history")
        Alamofire.request(URL).responseObject { [self] (response: DataResponse<ResponseHistory>) in

            let responsehistory = response.result.value
            self.historyResponse = responsehistory?.data ?? []

        }
    }

    func buttonToMethod() {
        navigationChooseMethod = NextChooseMethod.userValid.rawValue

    }

}

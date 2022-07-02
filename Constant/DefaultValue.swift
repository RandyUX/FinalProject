//
//  DefaultValue.swift
//  Project
//
//  Created by Randy on 28/06/22.
//

import ObjectMapper
import FirebaseCore

struct DefaultValue {
    static let emptyString: String = ""
    static let emptyValue: Int = 0

}

struct AnalyticsTags {
    static let visitHistory = "visithistory"
    static let visitMethod = "visitmethod"
    static let visitTimeSet = "visittimeset"
    static let visitConfirmationSummary = "visitconfirmationsummary"
    static let visitPin = "visitpin"
    static let visitfinalsummary = "visitfinishsummary"
    static let transferform = "transferform"
}

struct Server {
   static let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? DefaultValue.emptyString
}

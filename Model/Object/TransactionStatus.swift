//
//  TransactionStatus.swift
//  Project
//
//  Created by Randy on 30/06/22.
//

import Foundation
import ObjectMapper

struct TransactionStatus {
    var id: Int = DefaultValue.emptyValue
    var fullname: String = DefaultValue.emptyString
    var banknamed: String = DefaultValue.emptyString
    var rekeningaccount: String = DefaultValue.emptyString
    var status: String = DefaultValue.emptyString
    var transfermethod: String = DefaultValue.emptyString
    var notes: String = DefaultValue.emptyString
    var total: String = DefaultValue.emptyString
    var transactiontime: String = DefaultValue.emptyString
}
extension TransactionStatus: Mappable, Hashable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        id <- map["id"]
        fullname <- map["fullname"]
        banknamed <- map["banknamed"]
        rekeningaccount <- map["rekeningaccount"]
        status <- map["status"]
        transfermethod <- map["transfermethod"]
        notes <- map["notes"]
        total <- map["total"]
        transactiontime <- map["transactiontime"]

    }
}

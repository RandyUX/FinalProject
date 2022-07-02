//
//  ResponseTransactionStatus.swift
//  Project
//
//  Created by Randy on 30/06/22.
//

import Foundation
import ObjectMapper

struct ResponseTransactionStatus {
    var transactionstatus = [TransactionStatus]()
}
extension ResponseTransactionStatus: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        transactionstatus <- map["data"]
    }
}

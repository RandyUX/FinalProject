//
//  ConfirmResponseSummary.swift
//  Project
//
//  Created by Randy on 07/07/22.
//

import Foundation
import ObjectMapper

struct ResponseSummary {
    var message: String = DefaultValue.emptyString
    var data = ConfirmSummary()
}

extension ResponseSummary: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        message <- map["message"]
        data <- map["data"]
    }
}

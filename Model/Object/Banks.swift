//
//  Banks.swift
//  Project
//
//  Created by Randy on 28/06/22.
//

import Foundation
import ObjectMapper

struct Bank {
    var id: Int = DefaultValue.emptyValue
    var bankname: String = DefaultValue.emptyString
}
extension Bank: Mappable, Hashable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        id <- map["bankid"]
        bankname <- map["bankname"]
    }
}

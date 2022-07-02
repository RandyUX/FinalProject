//
//  ResponBank.swift
//  Project
//
//  Created by Randy on 28/06/22.
//

import Foundation
import ObjectMapper

struct ResponseBank {
    var bankdata = [Bank]()
}
extension ResponseBank: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        bankdata <- map["data"]
    }
}

//
//  pin.swift
//  Project
//
//  Created by Randy on 30/06/22.
//

import Foundation
import ObjectMapper

struct Pin {
    var id: Int = DefaultValue.emptyValue
    var pinlock: String = DefaultValue.emptyString
}
extension Pin: Mappable, Hashable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        id <- map["id"]
        pinlock <- map["pinlock"]
    }
}

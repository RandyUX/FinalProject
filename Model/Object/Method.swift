//
//  Method.swift
//  Project
//
//  Created by Randy on 30/06/22.
//

import Foundation
import ObjectMapper

struct Method {
    var id: Int = DefaultValue.emptyValue
    var methodname: String = DefaultValue.emptyString
}
extension Method: Mappable, Hashable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        id <- map["id"]
        methodname <- map["methodname"]
    }
}

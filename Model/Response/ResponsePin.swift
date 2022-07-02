//
//  ResponsePin.swift
//  Project
//
//  Created by Randy on 30/06/22.
//

import Foundation
import ObjectMapper

struct ResponsePin {
    var pindata = [Pin]()
}
extension ResponsePin: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        pindata <- map["data"]
    }
}

//
//  ResponseMethod.swift
//  Project
//
//  Created by Randy on 30/06/22.
//

import Foundation
import ObjectMapper

struct ResponseMethod {
    var methoddata = [Method]()
}
extension ResponseMethod: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        methoddata <- map["data"]
    }
}

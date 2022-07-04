//
//  User.swift
//  Project
//
//  Created by RANDY on 04/07/22.
//

import Foundation
import ObjectMapper

struct DataUser {
    var id: Int = DefaultValue.emptyValue
    var fullnamed: String = DefaultValue.emptyString
    var banknamed: String = DefaultValue.emptyString
    var rekeningaccount: String = DefaultValue.emptyString

}
    extension DataUser: Mappable, Hashable {
        public init?(map: Map) { self.init() }
        public mutating func mapping(map: Map) {
            id <- map["id"]
            fullnamed <- map["fullnamed"]
            banknamed <- map["banknamed"]
            rekeningaccount <- map["rekeningaccount"]
        }
}

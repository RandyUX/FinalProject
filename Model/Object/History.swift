//
//  History.swift
//  Project
//
//  Created by RANDY on 02/07/22.
//

import Foundation
import ObjectMapper

class History: Mappable, Identifiable {
    var id: Int = DefaultValue.emptyValue
    var fullnamed: String = DefaultValue.emptyString
    var banknamed: String = DefaultValue.emptyString
    var rekeningaccount: String = DefaultValue.emptyString
    required init?(map: Map) {

        }

        func mapping(map: Map) {
            id <- map["id"]
            fullnamed <- map["fullnamed"]
            banknamed <- map["banknamed"]
            rekeningaccount <- map["rekeningaccount"]
        }
}

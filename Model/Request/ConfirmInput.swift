//
//  ConfirmInput.swift
//  Project
//
//  Created by Randy on 07/07/22.
//

import Foundation
import ObjectMapper

struct ConfirmInput {
    var banknamed: String = DefaultValue.emptyString
    var rekeningAccount: String = DefaultValue.emptyString
    var notes: String = DefaultValue.emptyString
    var total: Int = DefaultValue.emptyValue
}

extension ConfirmInput: Mappable, Hashable {
    public init?(map: Map) { self.init() }

    public mutating func mapping(map: Map) {
        banknamed <- map["banknamed"]
        rekeningAccount <- map["rekeningAccount"]
        notes <- map["notes"]
        total <- map["Total"]
    }
}

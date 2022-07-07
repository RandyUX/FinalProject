//
//  ConfirmSummary.swift
//  Project
//
//  Created by Randy on 07/07/22.
//

// import Foundation
import ObjectMapper

struct ConfirmSummary {
    var notes = DefaultValue.emptyString
    var total = DefaultValue.emptyValue
    var listbank = Bank()
    var datauser = DataUser()
}

extension ConfirmSummary: Mappable, Hashable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        datauser <- map["user"]
        notes <- map["notes"]
        total <- map["Total"]
        listbank <- map["checkbank"]
    }
}

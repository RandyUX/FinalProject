//
//  ResponseHistory.swift
//  Project
//
//  Created by RANDY on 02/07/22.
//

import Foundation
import ObjectMapper

class ResponseHistory: Mappable, Identifiable {

    var data: [History]?

    required init?(map: Map) {

        }

        func mapping(map: Map) {
            data <- map["data"]

        }
}

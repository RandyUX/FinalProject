//
//  ResponseDataUser.swift
//  Project
//
//  Created by RANDY on 04/07/22.
//

import Foundation
import ObjectMapper

class ResponseDataUser: Mappable, Identifiable {

    var data: [DataUser]?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        data <- map["data"]

    }
}

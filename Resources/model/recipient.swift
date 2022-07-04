//
//  Article.swift
//  Project
//
//  Created by Randy on 24/06/22.
//

import Foundation
    struct Recipient: Codable {
        var id: String = ""
        var fullname: String = ""
        var rekeningaccount: String = ""

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case fullname = "fullname"
            case rekeningaccount = "rekeningaccount"
    }
}

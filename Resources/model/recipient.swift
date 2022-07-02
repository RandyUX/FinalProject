//
//  Article.swift
//  Project
//
//  Created by Randy on 24/06/22.
//

import Foundation
//
// struct Article: Codable{
//    var title: String = ""
//    var postedDate: String = ""
//    var imageUrl: String = ""
//    var user = User()
//    
//    
//    enum CodingKeys: String, CodingKeys {
//        case title = "title"
//        case postedDate = "postedDate"
//        case imageUrl = "imageUrl"
//        case user = "user"
//    }
// }
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

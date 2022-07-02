//
//  ResponseTransaction.swift
//  Project
//
//  Created by Randy on 28/06/22.
//

 import ObjectMapper
 struct ResponseUserAccount {
    var useraccount = [Users]()
 }
 extension ResponseUserAccount: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        useraccount <- map["data"]
    }
 }

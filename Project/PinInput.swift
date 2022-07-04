//
//  PinInput.swift
//  Project
//
//  Created by RANDY on 04/07/22.
//

import Foundation

class InsertPin {

    static let authenticatePin = InsertPin()

    func savePin(pin: String) {
        UserDefaults.standard.set(pin, forKey: "pin")
    }

    func getPin() -> String {
        return UserDefaults.standard.string(forKey: "pin") ?? ""
    }
}

//
//  AnalyticsManager.swift
//  Project
//
//  Created by Randy on 29/06/22.
//

import Foundation
import FirebaseCore
import FirebaseAnalytics

struct AnalyticsManager {
    // static let instance = AnalyticsManager()

    static func log(_ tag: String) {
        Analytics.logEvent(tag, parameters: [
            "confirmationsummary": AnalyticsTags.visitConfirmationSummary,
            "os": "ios"
        ])
    }
}

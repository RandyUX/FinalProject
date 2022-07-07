//
//  PinTransactionViewModel.swift
//  Project
//
//  Created by Randy on 05/07/22.
//

import Foundation

class PinTransactionViewModel: ObservableObject {
    private func onLoad() {
        AnalyticsManager.log(AnalyticsTags.visitfinalsummary)
    }
}

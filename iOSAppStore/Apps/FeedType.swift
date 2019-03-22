//
//  FeedType.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/22/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import Foundation
enum FeedType: String {
    case newAppsWeLove = "new-apps-we-love"
    case newGamesWeLove = "new-games-we-love"
    case topFree = "top-free"
    case topGrossing = "top-grossing"

    static func allCases() -> [FeedType] {
        let types: [FeedType] = [
            .newAppsWeLove,
            .newGamesWeLove,
            .topFree,
            .topGrossing,
        ]

        return types
    }
}

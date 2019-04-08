//
//  FetchAppsWorker.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/22/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import Foundation
struct FetchAppsWorker {
    var feedType: FeedType
    var completion: ((AppGroup) -> Void)?
    private var api = "https://rss.itunes.apple.com/api/v1/us/ios-apps/%@/all/50/explicit.json"
    init(feedType: FeedType, completion: ((AppGroup) -> Void)?) {
        self.feedType = feedType
        self.completion = completion
    }

    private func completeResponse(appgroup: AppGroup?, error: Error?) {
        guard let apps = appgroup else { return }
        completion?(apps)
    }
    func execute() {
        let finalApi = String(format: api, feedType.rawValue)
        Service.execute(urlString: finalApi, completion: completeResponse)
    }
}

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

    func execute() {
        let finalApi = String(format: api, feedType.rawValue)
        guard let url = URL(string: finalApi) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("fetchItunesApps fails: \(error)")
                return
            }

            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(AppGroup.self, from: data)
                self.completion?(searchResult)

            } catch let jsonErr {
                print("Fail to decode json", jsonErr)
            }
            }.resume()
    }
}

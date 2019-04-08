//
//  FetchSearchResultWorker.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/21/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import Foundation

struct FetchSearchResultWorker {
    var keyword: String
    var completion: (([Result]) -> Void)?
    init(keyword: String, completion: (([Result]) -> Void)?) {
        self.keyword = keyword
        self.completion = completion
    }

    private func completeResponse(results: SearchResult?, error: Error?) {
        guard let data = results else { return }
        completion?(data.results)
    }

    func execute() {
        let urlString = "https://itunes.apple.com/search?term=\(keyword)&entity=software"
        Service.execute(urlString: urlString, completion: completeResponse)
    }
}

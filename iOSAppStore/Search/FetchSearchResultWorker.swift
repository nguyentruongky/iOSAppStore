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
    func execute() {
        let urlString = "https://itunes.apple.com/search?term=\(keyword)&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("fetchItunesApps fails: \(error)")
                return
            }

            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                self.completion?(searchResult.results)

            } catch let jsonErr {
                print("Fail to decode json", jsonErr)
            }
            }.resume()
    }
}

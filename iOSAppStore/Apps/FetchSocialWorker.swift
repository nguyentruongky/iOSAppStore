//
//  FetchSocialWorker.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/28/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import Foundation

struct SocialApp: Decodable {
    let id, name, imageUrl, tagline: String
}

class FetchSocialWorker {
    private let api = "https://api.letsbuildthatapp.com/appstore/social"
    var completion: (([SocialApp]) -> Void)?
    init(completion: @escaping ([SocialApp]) -> Void) {
        self.completion = completion
    }

    func execute() {
        Service.execute(urlString: api, completion: completeResponse)
    }

    private func completeResponse(apps: [SocialApp]?, error: Error?) {
        guard let apps = apps else { return }
        completion?(apps)
    }
}

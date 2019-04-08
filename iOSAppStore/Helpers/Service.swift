//
//  Service.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/29/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import Foundation
struct Service {
    static func execute<T: Decodable>(urlString: String,
                               completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("fetchItunesApps fails: \(error)")
                completion(nil, error)
                return
            }

            guard let data = data else { return }
            do {
                let results = try JSONDecoder().decode(T.self, from: data)
                completion(results, nil)

            } catch let jsonErr {
                print("Fail to decode json", jsonErr)
            }
            }.resume()
    }
}

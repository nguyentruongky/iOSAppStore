//
//  AppsSearchController.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/20/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit

class AppsSearchController: BaseListController {
    fileprivate let cellId = "id"
    fileprivate var appResults = [Result]()
    private let searchController = UISearchController(searchResultsController: nil)
    private let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter search text above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        fetchItunesApps(keyword: "")
        setupSearchBar()
        view.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview()
    }

    func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    @objc fileprivate func fetchItunesApps(keyword: String) {
        FetchSearchResultWorker(keyword: keyword) { [weak self] (results) in
            self?.appResults = results
            DispatchQueue.main.async {
                self?.enterSearchTermLabel.isHidden = !results.isEmpty
                self?.collectionView.reloadData()
            }
        }.execute()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.setData(appResults[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
}

extension AppsSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        perform(#selector(fetchItunesApps), with: searchText, afterDelay: 0.35)
    }
}

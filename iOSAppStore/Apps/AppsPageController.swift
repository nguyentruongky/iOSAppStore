//
//  AppsController.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/22/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit

class AppsPageController: BaseListController {
    private let cellId = "cellId"
    private let headerId = "headerId"
    var header: AppsPageHeader?
    let activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .whiteLarge)
        view.color = .black
        view.startAnimating()
        view.hidesWhenStopped = true
        return view
    }()

    var datasource = [AppGroup]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white

        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        fetchData()

        view.addSubview(activityView)
        activityView.fillSuperview()
    }

    func fetchData() {
        let dispatchGroup = DispatchGroup()
        let types = FeedType.allCases()

        for type in types {
            dispatchGroup.enter()
            FetchAppsWorker(feedType: type,
                            completion: { [weak self] result in
                                self?.datasource.append(result)
                                dispatchGroup.leave()
            }).execute()
        }

        FetchSocialWorker { [weak self] (apps) in
            DispatchQueue.main.async {
                self?.header?.setApps(apps: apps)
                self?.activityView.stopAnimating()
            }
            }.execute()

        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.collectionView.reloadData()
            self?.activityView.stopAnimating()
        }


    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        self.header = header
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 280)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        cell.setData(datasource[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }






}

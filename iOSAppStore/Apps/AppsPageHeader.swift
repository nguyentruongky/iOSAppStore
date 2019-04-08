//
//  AppsPageHeader.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/22/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    private let appHeaderHorizontalController = AppsHeaderHorizontalController()
    func setApps(apps: [SocialApp]) {
        appHeaderHorizontalController.datasource = apps
        appHeaderHorizontalController.collectionView.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

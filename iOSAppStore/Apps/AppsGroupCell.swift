//
//  AppsGroupCell.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/22/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    private var data: AppGroup?
    func setData(_ data: AppGroup) {
        self.data = data
        titleLabel.text = data.feed.title
        horizontalController.setData(data.feed.results)
    }

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "App section"
        return label
    }()

    let horizontalController = AppsHorizontalController()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    func setupView() {
        backgroundColor = .white
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 16, bottom: 4, right: 16), size: .zero)

        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

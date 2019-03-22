//
//  AppRowCell.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/22/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit
import SDWebImage

class AppRowCell: UICollectionViewCell {
    private var data: FeedResult?
    func setData(_ data: FeedResult) {
        self.data = data

        let url = URL(string: data.artworkUrl100)
        appIconImageView.sd_setImage(with: url)

        nameLabel.text = data.name
        companyLabel.text = data.artistName

    }

    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.backgroundColor = .green
        return iv
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "App Name"
        return label
    }()

    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Conpany name"
        return label
    }()

    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 64).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let labelsStackView = UIStackView(arrangedSubviews: [
            nameLabel,
            companyLabel
            ])
        labelsStackView.axis = .vertical

        let stackView = UIStackView(arrangedSubviews: [
            appIconImageView, labelsStackView, getButton
            ])
        stackView.spacing = 16
        stackView.alignment = .center

        addSubview(stackView)
        stackView.fillSuperview()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

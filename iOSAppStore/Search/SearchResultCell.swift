//
//  SearchResultCell.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/20/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit
import SDWebImage

class SearchResultCell: UICollectionViewCell {
    private var data: Result?
    func setData(_ data: Result) {
        self.data = data
        nameLabel.text = data.trackName
        categoryLabel.text = data.primaryGenreName
        if let rating = data.averageUserRating {
            ratingLabel.text = "Rating: \(rating)"
        } else {
            ratingLabel.text = ""
        }

        let appUrl = URL(string: data.artworkUrl100)
        appIconImageView.sd_setImage(with: appUrl)

        for i in 0 ..< screenshotImageViews.count {
            if data.screenshotUrls.count > i {
                let url = URL(string: data.screenshotUrls[i])
                screenshotImageViews[i].sd_setImage(with: url)
            }
        }
    }

    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "App Name"
        return label
    }()

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        return label
    }()

    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.5"
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

    var screenshotImageViews = [UIImageView]()

    func createScreenshotImageView() -> UIImageView {
        let iv = UIImageView()
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        iv.contentMode = .scaleAspectFill
        return iv
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        screenshotImageViews = [
            createScreenshotImageView(),
            createScreenshotImageView(),
            createScreenshotImageView(),
        ]

        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel])
        labelsStackView.axis = .vertical

        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, labelsStackView, getButton])
        infoTopStackView.alignment = .center
        infoTopStackView.spacing = 12
        infoTopStackView.translatesAutoresizingMaskIntoConstraints = false


        let screenshotsStackView = UIStackView(arrangedSubviews: [
            screenshotImageViews[0],
            screenshotImageViews[1],
            screenshotImageViews[2],
        ])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        

        let overallStackView = UIStackView(arrangedSubviews: [
            infoTopStackView,
            screenshotsStackView
        ])
        overallStackView.axis = .vertical
        overallStackView.spacing = 16

        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

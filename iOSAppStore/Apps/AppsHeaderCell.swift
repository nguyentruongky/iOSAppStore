//
//  AppsHeaderCell.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/22/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit
import SDWebImage

class AppsHeaderCell: UICollectionViewCell {
    private var data: SocialApp?
    func setData(_ data: SocialApp) {
        self.data = data
        companyLabel.text = data.name
        titleLabel.text = data.tagline
        if let url = URL(string: data.imageUrl) {
            imageView.sd_setImage(with: url)
        }

    }
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Conpany name"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .blue
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.backgroundColor = .green
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    func setupView() {
        backgroundColor = .white

        let stackView = UIStackView(arrangedSubviews: [
            companyLabel,
            titleLabel,
            imageView
            ])
        stackView.axis = .vertical
        stackView.spacing = 12
        addSubview(stackView)
        stackView.fillSuperview(padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

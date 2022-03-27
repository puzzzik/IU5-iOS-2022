//
//  CollectionViewCell.swift
//  Lab3Swift
//
//  Created by Иван Тазенков on 16.03.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(image: UIImage?, title: String?, subtitle: String?) {
        setupImage(image: image)
        setupTitle(title: title)
        setupSubtitle(subtitle: subtitle)
    }

    private func setupTitle(title: String?) {
        guard title != nil else {
            titleLabel.text = "???"
            return
        }
        titleLabel.text = title
    }

    private func setupSubtitle(subtitle: String?) {
        guard subtitle != nil else {
            subtitleLabel.text = "???"
            return
        }
        subtitleLabel.text = subtitle
    }

    private func setupImage(image: UIImage?) {
        guard image != nil else {
            imageView.image = UIImage(systemName: "exclamationmark.icloud")
            return
        }
        imageView.image = image
    }
}

//
//  Lab5CollectionViewCell.swift
//  LABS
//
//  Created by Иван Тазенков on 30.03.2022.
//

import UIKit

class Lab5CollectionViewCell: UICollectionViewCell {
	private var titleLabel = UILabel()
	private var subtitleLabel = UILabel()
	private var imageView = UIImageView()
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupViews()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	private func setupViews() {
		addSubview(titleLabel)
		addSubview(subtitleLabel)
		addSubview(imageView)
	}
	
	override func layoutSubviews() {
		imageView.frame = CGRect(x: 10,
								 y: 10,
								 width: 40,
								 height: 40)
		titleLabel.frame = CGRect(x: imageView.frame.maxX + 5,
								  y: 10,
								  width: contentView.frame.width,
								  height: 20)
		subtitleLabel.frame = CGRect(x: imageView.frame.maxX + 5,
									 y: titleLabel.frame.maxY + 10,
									 width: contentView.frame.width,
									 height: 15)
	}
	
	func configure(image: UIImage?, title: String?, subtitle: String?) {
		setupImage(image: image)
		setupTitle(title: title)
		setupSubtitle(subtitle: subtitle)
	}
	
	private func setupTitle(title: String?) {
		titleLabel.font = UIFont.systemFont(ofSize: 17)
		guard title != nil else {
			titleLabel.text = "???"
			return
		}
		
		titleLabel.text = title
	}
	
	private func setupSubtitle(subtitle: String?) {
		subtitleLabel.font = UIFont.systemFont(ofSize: 15)
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


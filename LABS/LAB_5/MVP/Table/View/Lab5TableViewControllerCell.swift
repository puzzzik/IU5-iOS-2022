//
//  Lab5TableViewControllerCell.swift
//  LABS
//
//  Created by Иван Тазенков on 29.03.2022.
//

import Foundation
import UIKit

final class Lab5TableViewControllerCell: UITableViewCell {
	private let titleLabel = UILabel()
	private let subtitleLabel = UILabel()
	private let imageAvatar = UIImageView()
	
	private enum FrameSizes {
		enum title {
			static let x: CGFloat = 65
			static let y: CGFloat = 3
			static let height: CGFloat = 25
		}
		enum subtitle {
			static let x: CGFloat = 65
			static let y: CGFloat = 25
			static let height: CGFloat = 15
		}
		enum image {
			static let x: CGFloat = 15
			static let y: CGFloat = 10
			static let width: CGFloat = 30
			static let height: CGFloat = 30
		}
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupViews()
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		titleLabel.text = ""
	}
	
	override func layoutSubviews() {
		titleLabel.frame = CGRect(x: FrameSizes.title.x,
								  y: FrameSizes.title.y,
		                          width: frame.width - 150,
								  height: FrameSizes.title.height)
		subtitleLabel.frame = CGRect(x: FrameSizes.subtitle.x,
									 y: FrameSizes.subtitle.y,
									 width: frame.width - 150,
									 height: FrameSizes.subtitle.height)
		imageAvatar.frame = CGRect(x: FrameSizes.image.x,
								   y: FrameSizes.image.y,
								   width: FrameSizes.image.width,
								   height: FrameSizes.image.height)
	}
	
	private func setupViews() {
		addSubview(titleLabel)
		addSubview(subtitleLabel)
		addSubview(imageAvatar)
		titleLabel.font = UIFont.systemFont(ofSize: 20)
		subtitleLabel.font = UIFont.systemFont(ofSize: 12)
	}
	
	func configure(title: String, subtitle: String, image: UIImage?) {
		titleLabel.text = title
		subtitleLabel.text = subtitle
		guard image != nil else {
			imageAvatar.image = UIImage(systemName: "exclamationmark.octagon.fill")
			return
		}
		imageAvatar.image = image
	}
}

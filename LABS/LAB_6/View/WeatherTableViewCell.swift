//
//  WeatherTableViewCell.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import UIKit

class WeatherTableViewCell: UITableViewCell {
	private let propertyNameLabel = UILabel()
	private let propertyResultLabel = UILabel()
	
	private enum FrameSizes {
		enum propertyName {
			static let x: CGFloat = 20
			static let y: CGFloat = 1
			static let width: CGFloat = 160
			static let height: CGFloat = 48
		}
		
		enum propertyResult {
			static let x: CGFloat = 30
			static let y: CGFloat = 1
			static let height: CGFloat = 48
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
		propertyNameLabel.text = ""
	}
	
	override func layoutSubviews() {
		propertyNameLabel.frame = CGRect(x: FrameSizes.propertyName.x,
		                                 y: FrameSizes.propertyName.y,
		                                 width: FrameSizes.propertyName.width,
		                                 height: FrameSizes.propertyName.height)
		propertyResultLabel.frame = CGRect(x: propertyNameLabel.frame.maxX + FrameSizes.propertyResult.x,
		                                   y: FrameSizes.propertyResult.y,
		                                   width: frame.width - propertyNameLabel.frame.maxX - 50,
		                                   height: FrameSizes.propertyResult.height)
	}
	
	private func setupViews() {
		addSubview(propertyNameLabel)
		addSubview(propertyResultLabel)
		propertyResultLabel.lineBreakMode = .byWordWrapping
		propertyResultLabel.numberOfLines = 2
	}
	
	func configure(propertyName: String, propertyResult: String?) {
		propertyNameLabel.text = propertyName
		guard propertyResult != nil else {
			return
		}
		propertyResultLabel.text = propertyResult
	}
}

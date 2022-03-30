//
//  Lab5CollectionViewHeader.swift
//  LABS
//
//  Created by Иван Тазенков on 30.03.2022.
//

import Foundation
import UIKit

class Lab5CollectionViewHeaderFooter: UICollectionReusableView {
	private let titleLabel = UILabel()
	private enum Constants {
		static let titleX: CGFloat = 5
		static let titleY: CGFloat = 2
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupViews()
	}
	
	private func setupViews() {
		addSubview(titleLabel)
		titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
		titleLabel.textAlignment = .center
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		titleLabel.frame = CGRect(x: Constants.titleX,
								  y: Constants.titleY,
								  width: frame.width,
								  height: frame.height)
	}
	func cofigure(text: String, color: UIColor) {
		titleLabel.text = text
		backgroundColor = color
	}
}

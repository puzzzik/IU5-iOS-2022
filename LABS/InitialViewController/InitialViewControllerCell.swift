//
//  InitialViewControllerCell.swift
//  LABS
//
//  Created by Иван Тазенков on 19.03.2022.
//

import UIKit

class InitialViewControllerCell: UITableViewCell {
	private let nameLabel = UILabel()
	
	private enum labelConstraints {
		static let x: CGFloat = 8
		static let y: CGFloat = 8
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
		nameLabel.text = ""
	}

	override func layoutSubviews() {
		nameLabel.frame = CGRect(x: labelConstraints.x,
		                         y: labelConstraints.y,
		                         width: frame.width - 16,
		                         height: frame.height - 16)
	}
    
	private func setupViews() {
		addSubview(nameLabel)
		backgroundColor = .systemGray6
	}
    
	func configure(text: String) {
		nameLabel.text = text
	}
}

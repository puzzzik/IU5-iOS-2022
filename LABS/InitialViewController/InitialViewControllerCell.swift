//
//  InitialViewControllerCell.swift
//  LABS
//
//  Created by Иван Тазенков on 19.03.2022.
//

import UIKit

class InitialViewControllerCell: UITableViewCell {
    // MARK: Private Properties

    private let nameLabel = UILabel()

    // MARK: Private Data Struct

    private enum labelConstraints {
        static let x: CGFloat = 8
        static let y: CGFloat = 8
    }

    // MARK: Lifecycle

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
                                 width: frame.width - 2 * labelConstraints.x,
                                 height: frame.height - 2 * labelConstraints.y)
    }

    // MARK: Private Methods

    private func setupViews() {
        addSubview(nameLabel)
        backgroundColor = .systemGray6
    }

    // MARK: Internal Methods

    func configure(text: String) {
        nameLabel.text = text
    }
}

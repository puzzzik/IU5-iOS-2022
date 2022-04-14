//
//  WeatherTableViewCell.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import UIKit

// MARK: - WeatherTableViewCell

final class WeatherTableViewCell: UITableViewCell {
    // MARK: Private Properties

    private let titleLabel = UILabel()
    private let contentLabel = UILabel()

    // MARK: Private Data Struct

    private enum Constants {
        static let topOffset: CGFloat = 15
        static let leadingOffset: CGFloat = 20
        static let interitemSpace: CGFloat = 150
    }

    // MARK: Internal Data Struct

    struct DisplayData {
        let title: String
        let content: String
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
        titleLabel.text = nil
        contentLabel.text = nil
    }

    // MARK: Internal Methods

    func configure(with displayData: DisplayData) {
        titleLabel.text = displayData.title
        contentLabel.text = displayData.content
    }

    // MARK: Private Methods

    private func setupViews() {
        addSubview(contentLabel)
        contentLabel.lineBreakMode = .byWordWrapping
        setupTitleLabel()
        setupContentLabel()
    }

    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: Constants.topOffset),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: Constants.leadingOffset),
        ])
        titleLabel.font = .systemFont(ofSize: 15)
    }

    private func setupContentLabel() {
        addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                              constant: Constants.topOffset),
            contentLabel.leadingAnchor.constraint(lessThanOrEqualTo: trailingAnchor,
                                                  constant: -Constants.interitemSpace),
        ])
        contentLabel.font = .systemFont(ofSize: 15)
    }
}

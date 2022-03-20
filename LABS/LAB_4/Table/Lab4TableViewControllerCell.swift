//
//  Lab4TableViewControllerCell.swift
//  LABS
//
//  Created by Иван Тазенков on 20.03.2022.
//

import Foundation
import UIKit

final class Lab4TableViewControllerCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let imageAvatar = UIImageView()
    
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
        titleLabel.frame = CGRect(x: 65,
                                  y: 3,
                                  width: frame.width - 150,
                                  height: 25)
        subtitleLabel.frame = CGRect(x: 65,
                                     y: 25,
                                     width: frame.width - 150,
                                     height: 15)
        imageAvatar.frame = CGRect(x: 15,
                                     y: 10,
                                     width: 30,
                                     height: 30)
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

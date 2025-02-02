//
//  Lab4TableViewHeaderView.swift
//  LABS
//
//  Created by Иван Тазенков on 20.03.2022.
//

import UIKit

class Lab4TableViewHeaderFooterView: UITableViewHeaderFooterView {

    private let title = UILabel()
    private lazy var line: UIView = UIView()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = ""
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        title.frame = CGRect(x: 15,
                             y: 0,
                             width: contentView.frame.width - 30,
                             height: contentView.frame.height)
        if reuseIdentifier == "HeaderView" {
            line.frame = CGRect(x: 15,
                                y: contentView.frame.maxY - 1,
                                width: contentView.frame.width,
                                height: 1)
        } else if reuseIdentifier == "FooterView" {
            line.frame = CGRect(x: 65,
                                y: -10,
                                width: contentView.frame.width,
                                height: 1)
        }
    }
    private func setupViews() {
        contentView.addSubview(title)
        contentView.addSubview(line)
        line.backgroundColor = .systemGray3
    }
    
    func configure(text: String) {
        title.attributedText = NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14),
                NSAttributedString.Key.foregroundColor : UIColor.systemGray]
        )
    }

}

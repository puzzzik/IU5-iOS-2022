//
//  Lab4CollectionViewHeader.swift
//  LABS
//
//  Created by Иван Тазенков on 21.03.2022.
//

import UIKit

class Lab4CollectionViewHeaderFooter: UICollectionReusableView {
    private let titleLabel = UILabel()
    
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
        titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title1)
        titleLabel.textAlignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = bounds
    }
    func cofigure(text: String, color: UIColor) {
        titleLabel.text = text
        backgroundColor = color
    }
}

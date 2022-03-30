//
//  Lab5CollectionViewEntity.swift
//  LABS
//
//  Created by Иван Тазенков on 29.03.2022.
//

import Foundation
import UIKit

struct Lab5CollectionViewCellData {
	var image: UIImage
	var title: String
	var subtitle: String
	
	init(image: UIImage, title: String, subtitle: String) {
		self.image = image
		self.title = title
		self.subtitle = subtitle
	}
	
	
}

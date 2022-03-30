//
//  Lab5TableViewIO.swift
//  LABS
//
//  Created by Иван Тазенков on 27.03.2022.
//

import Foundation
import UIKit
protocol Lab5TableViewInput: AnyObject {}

protocol Lab5TableViewOutput: AnyObject {
	
	func userDidSelectRow()
	func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	func setHeader(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
	func setFooter(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?

}

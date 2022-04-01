//
//  Lab5TablePresenter.swift
//  LABS
//
//  Created by Иван Тазенков on 27.03.2022.
//

import Foundation
import UIKit
final class Lab5TablePresenter {
	weak var view: Lab5TableViewInput!
	weak var moduleOutput: Lab5TableModuleOutput!
}

extension Lab5TablePresenter: Lab5TableViewOutput {
	func userDidSelectRow() {
		moduleOutput?.lab5TableModuleWantsToOpenStuffModule()
	}

	func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "Lab5TableViewControllerCell") as? Lab5TableViewControllerCell else {
			return UITableViewCell()
		}
		cell.configure(title: "Main view",
		               subtitle: "Opens view with UIKit stuff",
		               image: UIImage(systemName: "doc.circle"))
		return cell
	}

	func setHeader(_ tableView: UITableView,
	               viewForHeaderInSection section: Int) -> UIView?
	{
		guard let header = tableView.dequeueReusableHeaderFooterView(
			withIdentifier: "HeaderView") as? Lab5TableViewHeaderFooterView
		else {
			return UIView()
		}
		header.configure(text: "All views")
		return header
	}

	func setFooter(_ tableView: UITableView,
	               viewForFooterInSection section: Int) -> UIView?
	{
		guard let footer = tableView.dequeueReusableHeaderFooterView(
			withIdentifier: "FooterView") as? Lab5TableViewHeaderFooterView
		else {
			return UIView()
		}
		footer.configure(text: "TODO: - Add some new views")
		return footer
	}
}

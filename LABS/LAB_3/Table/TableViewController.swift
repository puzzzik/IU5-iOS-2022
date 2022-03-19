//
//  TableViewController.swift
//  Lab3Swift
//
//  Created by Иван Тазенков on 11.03.2022.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    private func setupTable() {
        title = "Табличечка"
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.sectionHeaderHeight = 50
    }
    

}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subtitle", for: indexPath)
        
        cell.textLabel!.text = "Main view"
        cell.textLabel!.font = UIFont.systemFont(ofSize: 20.0)
        cell.imageView!.image = UIImage(systemName: "doc.circle")
        cell.detailTextLabel!.text = "Opens view with UIKit stuff"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "All views"
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
       return "TODO: - Add some new views"
    }
    
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let stuffViewController = storyboard.instantiateViewController(identifier: "stuffViewController")
//
//        show(stuffViewController, sender: self)
            
        let viewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "stuffViewController")

        navigationController?.pushViewController(viewController, animated: true)
    
    }
}

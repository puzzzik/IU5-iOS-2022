//
//  ViewController.swift
//  Lab3Swift
//
//  Created by Иван Тазенков on 11.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TableButton: UIButton!
    @IBOutlet weak var CollectionButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableButton()
        setupCollectionButton()
        setupTitle()
    }


    private func setupTableButton() {
        TableButton.setTitle("TableView", for: .normal)
    }
    private func setupCollectionButton() {
        CollectionButton.setTitle("CollectionView", for: .normal)
    }
    private func setupTitle() {
        title = "Main controller"
    }
    
    @IBAction func TapTableButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tableViewController = storyboard.instantiateViewController(identifier: "tableViewController")

        show(tableViewController, sender: self)
    }
    
    @IBAction func TapCollectionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let collectionViewController = storyboard.instantiateViewController(identifier: "collectionViewController")

        show(collectionViewController, sender: self)
        
    }
    
    
}


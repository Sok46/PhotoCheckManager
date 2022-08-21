//
//  ManagerViewController.swift
//  PhotoCheckManager
//
//  Created by Сергей on 21.08.2022.
//

import UIKit
import RealmSwift

class ManagerViewController: UIViewController {
    var items: Results<Item>!

    let imagepicker = UIImagePickerController()
    var tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(TextViewTableViewCell.self, forCellReuseIdentifier: TextViewTableViewCell.identifier)
        tableView.register(LabelTableViewCell.self, forCellReuseIdentifier: LabelTableViewCell.identifier)
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = .none
        
        return tableView
    }()
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        self.items = realm.objects(Item.self)
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        imagepicker.delegate = self
        imagepicker.allowsEditing = true
        setupViews()
        
    }
    
    let picture: UIImageView = {
        let picture = UIImageView()
        picture.backgroundColor = .white
        picture.translatesAutoresizingMaskIntoConstraints = false
        return picture
    }()
    
    private func setupViews() {
        createCustomNavigationBar()
        
        let AddRightButton = createCustomButton(
            imageName: "plus",
            selector: #selector(audioRightButtonTapped)
        )
        let cameraRightButton = createCustomButton(
            imageName: "camera",
            selector: #selector(clickToImage)
        )
        

        
        navigationItem.rightBarButtonItems = [AddRightButton, cameraRightButton]
        configureTableView()
    }

    
    @objc private func audioRightButtonTapped() {
        let item = Item()
        item.name = " Item \(self.items.count + 1)"
        let realm = try! Realm()
        try!  realm.write {
            realm.add(item)
        }
        
        tableView.reloadData()
        print("audioRightButtonTapped")
    }
    
    @objc private func videoRightButtonTapped() {
        print("videoRightButtonTapped")
    }
    
    
    

}



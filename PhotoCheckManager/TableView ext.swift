//
//  TableView ext.swift
//  PhotoCheckManager
//
//  Created by Сергей on 21.08.2022.
//

import UIKit
import RealmSwift

extension ManagerViewController: UITableViewDelegate, UITableViewDataSource, ReloadManager {
    func callReload(cell: TextViewTableViewCell) {
        tableView.reloadData() // передаём функцию в делегат
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.identifier, for: indexPath) as! TextViewTableViewCell
            cell.delegate = self
//            cell.picture.image = pick[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier, for: indexPath) as! LabelTableViewCell
            let name = self.items[indexPath.row].name
            cell.txtPole.text = name
        
                return cell
        }
            
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        let item = items[indexPath.row]
        let realm = try! Realm()
        try! realm.write{
             realm.delete(item)
        }
        tableView.reloadData()
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 180
        }else{
            return  UITableView.automaticDimension
        }
        

    }
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
        view.addSubview(picture)
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: view.topAnchor),
            picture.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            picture.heightAnchor.constraint(equalToConstant: 50),
            picture.widthAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
    }


}

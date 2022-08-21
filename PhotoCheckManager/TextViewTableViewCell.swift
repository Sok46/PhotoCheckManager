//
//  TextViewTableViewCell.swift
//  PhotoCheckManager
//
//  Created by Сергей on 21.08.2022.
//

import UIKit
import RealmSwift

protocol ReloadManager { // протокол для ReloadData (1)
  func callReload(cell:TextViewTableViewCell)
}

class TextViewTableViewCell: UITableViewCell, UITextViewDelegate {

    var delegate:ReloadManager? // вернувшийся делегат нашего протокола с обновлением(2)
       func btnClicked(_ sender:UIButton){
          delegate?.callReload(cell:self)
       }
    static let identifier = "TextViewTableViewCell"
    var placeholder = "Это UITextView. Введите тут многострочный текст и нажмите красную кнопку чтобы добавить.."

    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 10
        button .translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let picture: UIImageView = {
        let picture = UIImageView()
        picture.image = #imageLiteral(resourceName: "document")
        picture.contentMode = .scaleAspectFit
        picture.layer.cornerRadius = 40
        picture.backgroundColor = .lightGray
        picture.translatesAutoresizingMaskIntoConstraints = false
        return picture
    }()

    let txtPole: UITextView = {
       let txt = UITextView()
        txt.backgroundColor = .lightGray
        txt.layer.cornerRadius = 20
        txt.textContainer.lineFragmentPadding = 25
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.isScrollEnabled = false
        return txt
    }()
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        txtPole.delegate = self
        
        txtPole.text = placeholder
        txtPole.textColor = .gray
        
        constraints()
        
        // Configure the view for the selected state
    }

    @objc func addText (){
        print("klass")
        let item = Item()
            item.name = txtPole.text
       let realm = try! Realm()
       try!  realm.write {
           realm.add(item)
       }
       btnClicked(button)// вызов функции делегата(3)
        ManagerViewController().tableView.reloadData()
    }
  //MARK: - TextHolder for UITextview
    func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == .gray {
    textView.text = ""
    textView.textColor = .black
    }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
    textView.text = textView.text
    textView.textColor = UIColor.lightGray
    placeholder = ""
    } else {
    placeholder = "Это UITextView. Введите тут многострочный текст и нажмите красную кнопку чтобы добавить..."
    }
    }
    
    func textViewDidChange(_ textView: UITextView) {
    placeholder = textView.text
    }
    
    //MARK: - Set Constraints
    func constraints(){
        contentView.addSubview(txtPole)
        contentView.addSubview(picture)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(addText), for: .touchUpInside)
        NSLayoutConstraint.activate([
            txtPole.topAnchor.constraint(equalTo: picture.bottomAnchor,constant: 8),
            txtPole.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            txtPole.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            txtPole.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15),
            
            
            picture.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            picture.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            picture.heightAnchor.constraint(equalToConstant: 90),
            picture.widthAnchor.constraint(equalToConstant: 175),
        
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            button.leadingAnchor.constraint(equalTo: txtPole.leadingAnchor),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.heightAnchor.constraint(equalToConstant: 25)

        ])
    }

}

